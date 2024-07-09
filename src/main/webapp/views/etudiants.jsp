
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.lpw.annuaire.modals.Etudiant" %>
<%@ page import="com.lpw.annuaire.configs.Connect" %>
<%@ page import="com.lpw.annuaire.modals.Feliere" %>
<%@ page import="com.lpw.annuaire.modals.Departement" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%
    if(!Connect.open()){
        response.sendRedirect("error.jsp");
    }
    List<Departement> departements = null;
    List<Feliere> felieres = null;
    List<Etudiant> etudiants = null;

    departements = Connect.toDepartements(Connect.select("SELECT * FROM departement"));
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title> List Etudeiant</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
</head>
<body>
  <div class="wrapper d-flex align-items-stretch">
    <nav id="sidebar">
          <div class="p-4 pt-5">
            <img src="${pageContext.request.contextPath}/assets/images/LOGO_ENS_MARTIL_(1).png"  class="list-unstyled  logo mb-5" width="140px" height="140px" style="background-color: aliceblue;     margin: -27px auto;border-radius: 20px 20px 0px 0px;width: 140px;height: 140px;">
            <!-- Original static structure for reference -->
            <ul class="list-unstyled components mb-5">
              <li>
                <%
                for(Departement departement : departements){
                    String departementId = String.valueOf(departement.getId());
                %>
                  <a href="#submenu<%=departementId%>" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle"><%=departement.getLibelle()%></a>
                  <ul class="collapse list-unstyled" id="submenu<%=departementId%>">
                    <%
                    if(departementId != null){
                        felieres = Connect.toFelieres(Connect.select("SELECT F.id, F.libelle, D.id as 'departementId', D.libelle as 'departement' FROM feliere F INNER JOIN departement D on D.id = F.departement WHERE F.departement = " + departementId));
                        for (Feliere feliere: felieres) {
                       %>
                      <li><a class="px-[32] py-[7px] rounded-[16px] bg-main" href="${pageContext.request.contextPath}?departement=<%=departementId%>&feliere=<%=feliere.getId()%>"><%=feliere.getLibelle()%></a></li>
                      <%
                    }
                }
              %>
                  </ul>
                <% } %>  
              </li>
          </ul>
          <div class="footer">

          </div>

    </div>
  </nav>

    <!-- Page Content  -->
  <div id="content" class="p-4 p-md-5">
      <nav class="navbar navbar-expand-lg navbar-light bg-light">
          <div class="container-fluid">
              <button type="button" id="sidebarCollapse" class="btn btn-primary">
                <i class="fa fa-bars"></i>
                <span class="sr-only">Toggle Menu</span>
              </button>
              <button class="btn btn-dark d-inline-block d-lg-none ml-auto" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                  <i class="fa fa-bars"></i>
              </button>
              <div class="collapse navbar-collapse" id="navbarSupportedContent">
                  <ul class="nav navbar-nav ml-auto">
                      <li class="nav-item ">
                        <a class="nav-link" href="${pageContext.request.contextPath}/index.jsp" >Home</a>
                      </li>
                      <li class="nav-item active">
                      <a class="nav-link" href="${pageContext.request.contextPath}/views/etudiants.jsp">Etudiant</a>
                      </li>
                      <li class="nav-item">
                          <a class="nav-link" href="${pageContext.request.contextPath}/views/departements.jsp">Departements</a>
                      </li>
                      <li class="nav-item">
                          <a class="nav-link" href="${pageContext.request.contextPath}/views/felieres.jsp">Felieres</a>
                      </li>
                      <li class="nav-item">
                          <a class="nav-link" href="${pageContext.request.contextPath}/views/admin.jsp">Administration</a>
                      </li>
                  </ul>
              </div>
          </div>
      </nav>
      <div class="students-section">
        <%
        if (request.getAttribute("etudiants") != null) {
          etudiants = (ArrayList<Etudiant>) request.getAttribute("etudiants");
        } else {
          etudiants = Connect.toEtudiants(Connect.select("SELECT e.CNE, e.nom, e.prenom, e.telephone, d.libelle AS Departement, f.libelle AS Feliere FROM etudiant e LEFT JOIN departement d ON e.departement = d.id LEFT JOIN feliere f ON e.feliere = f.id;"));
        }
        %>          
          <h1 class="heading">List Des Etudiants</h1>
          <form action="${pageContext.request.contextPath}/recherche" method="POST" style="margin-bottom: 5px;">
            <label for="search">Rechercher Un Etudiant</label>
            <input id="search" name="search" type="text" />
            <input class="recherche-btn" type="submit" value="rechercher">
          </form>
          <table>
            <thead>
            <th>CNE</th>
            <th>Nom</th>
            <th>Prenom</th>
            <th>Telephone</th>
            <th>Departement</th>
            <th>Feliere</th>
            <th colspan="2"></th>
            </thead>
            <tbody>
            <%
              for(Etudiant etudiant : etudiants){
            %>
            <tr>
              <td><%=etudiant.getCNE()%></td>
              <td><%=etudiant.getNom()%></td>
              <td><%=etudiant.getPrenom()%></td>
              <td><%=etudiant.getTelephone()%></td>
              <td>
                <a href="${pageContext.request.contextPath}/?departement=<%=etudiant.getDepartement().getId()%>&feliere=<%=etudiant.getFeliere().getId()%>">
                  <%=etudiant.getDepartement().getLibelle()%>
                </a>
              </td>
              <td><%=etudiant.getFeliere().getLibelle()%></td>
              <td>
                <a class="link"  href="${pageContext.request.contextPath}/delete_etudiant?cne=<%=etudiant.getCNE()%>">
                  Suppremer
                </a>
              </td>
            </tr>
            <% } %>
            </tbody>
          </table>
        </div>
  </div>
</div>
</div>
<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/popper.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
</body>
</html>
