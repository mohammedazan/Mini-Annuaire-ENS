<%@ page import="java.util.ArrayList" %>
<%@ page import="com.lpw.annuaire.modals.Departement" %>
<%@ page import="com.lpw.annuaire.configs.Connect" %>
<%@ page import="com.lpw.annuaire.modals.Etudiant" %>
<%@ page import="com.lpw.annuaire.modals.Feliere" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%
    if(!Connect.open()){
        response.sendRedirect("error.jsp");
    }
    List<Departement> allDepartements = null;
    List<Feliere> allFelieres = null;
    List<Etudiant> etudiants = null;

    if (request.getAttribute("departements") != null){
        allDepartements = (List<Departement>) request.getAttribute("departements");
    } else {
        allDepartements = Connect.toDepartements(Connect.select("SELECT * FROM departement"));
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Add Etudeiant</title>
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
                        for (Departement departement : allDepartements) {
                            String departementId = String.valueOf(departement.getId());
                        %>
                          <a href="#submenu<%=departementId%>" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle"><%=departement.getLibelle()%></a>
                          <ul class="collapse list-unstyled" id="submenu<%=departementId%>">
                            <%
                            if (departementId != null) {
                                List<Feliere> departmentFelieres = Connect.toFelieres(Connect.select("SELECT F.id, F.libelle, D.id as 'departementId', D.libelle as 'departement' FROM feliere F INNER JOIN departement D on D.id = F.departement WHERE F.departement = " + departementId));
                                for (Feliere feliere : departmentFelieres) {
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
            <div>
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
                                <li class="nav-item">
                                    <a class="nav-link" href="${pageContext.request.contextPath}/index.jsp" >Home</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="${pageContext.request.contextPath}/views/etudiants.jsp">Etudiant</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="${pageContext.request.contextPath}/views/departements.jsp">Departements</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="${pageContext.request.contextPath}/views/felieres.jsp">Felieres</a>
                                </li>
                                <li class="nav-item active" >
                                    <a class="nav-link" href="${pageContext.request.contextPath}/views/admin.jsp">Administration</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </nav>   
            </div>         
            <div class="container" style="margin-top: auto;">
                <h1 class="heading">Ajouter Un Etudiant</h1>
                <form method="post" action="${pageContext.request.contextPath}/save_etudiant" class="form flex-col">
                    <div class="row">
                        <div class="field">
                            <label for="cne">CNE: </label>
                            <input id="cne" name="cne" type="text" class="text-input" />
                        </div>
                        <div class="field">
                            <label for="nom">Nom: </label>
                            <input id="nom" name="nom" type="text" class="text-input" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="field">
                            <label for="prenom">Prenom: </label>
                            <input id="prenom" name="prenom" type="text" class="text-input" />
                        </div>
                        <div class="field">
                            <label for="tele">Telephone: </label>
                            <input id="tele" name="tele" type="text" class="text-input" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="field">
                            <label for="feliere">Feliere: </label>
                            <select name="feliere" id="feliere">
                                <!-- <option value="1">ddd</option> -->
                                <%
                                List<Feliere> availableFelieres = Connect.toFelieres(Connect.select("SELECT F.id, F.libelle, D.libelle as 'departement', D.id as 'departementId' FROM feliere F INNER JOIN departement D on D.id = F.departement;"));
                                for (Feliere f : availableFelieres) {
                                %>
                                    <option value="<%=f.getId()%>"><%=f.getLibelle()%></option>
                                <%
                                }
                                %>
                            </select>
                        </div>
                        <div class="field">
                            <label for="departement">Departement: </label>
                            <select name="departement" id="departement">
                                <%
                                List<Departement> availableDepartements = Connect.toDepartements(Connect.select("Select * from departement;"));
                                for (Departement d : availableDepartements) {
                                %>
                                    <option value="<%=d.getId()%>"><%=d.getLibelle()%></option>
                                <%
                                }
                                %>
                            </select>
                        </div>
                    </div>
                    <div class="row">
                        <input style="margin-top: 20px" type="submit" value="enregistrer" class="button" />
                    </div>
                </form>
            </div>
        </div>
    </div>
    <script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/popper.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
</body>
</html>
