
<%@ page import="com.lpw.annuaire.modals.Departement" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="com.lpw.annuaire.modals.Feliere" %>
<%@ page import="com.lpw.annuaire.modals.Etudiant" %>
<%@ page import="com.lpw.annuaire.configs.Connect" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
<html>
<head>
  <link rel="stylesheet" href="styles/styles.css">
  <title>Mini Annuaire</title>
</head>
<body>
<div class="page-wrapper">
      <!--header class="cd-main-header js-cd-main-header">
        <div class="cd-logo-wrapper">
            <a href="#0" class="cd-logo"><img src="assets/img/cd-logo.svg" alt="Logo"></a>
        </div>
              <button class="reset cd-nav-trigger js-cd-nav-trigger" aria-label="Toggle menu"><span></span></button>
        <ul class="cd-nav__list js-cd-nav__list">
            <li class="cd-nav__item"><a href="${pageContext.request.contextPath}/views/etudiants.jsp" class="navbar-link">Etudiant</a></li>
            <li class="cd-nav__item"><a href="${pageContext.request.contextPath}/views/felieres.jsp" class="navbar-link">Felieres</a></li>
            <li class="cd-nav__item"><a href="${pageContext.request.contextPath}/views/departements.jsp" class="navbar-link">Departements</a></li>

            <li class="cd-nav__item cd-nav__item--has-children cd-nav__item--account js-cd-item--has-children">
              <a href="#0">
                <img src="assets/img/cd-avatar.svg" alt="avatar">
                <span><a href="${pageContext.request.contextPath}/views/admin.jsp" class="navbar-link">Administration</a></span>
              </a>
          
              <ul class="cd-nav__sub-list">
                <li class="cd-nav__sub-item"><a style="min-width: fit-content" href="${pageContext.request.contextPath}/views/add-etudiant.jsp" class="button">Ajouter Etudiant</a></li>
                <li class="cd-nav__sub-item"><a style="min-width: fit-content" href="${pageContext.request.contextPath}/views/add-departement.jsp" class="button">Ajouter Departement</a></li>
                <li class="cd-nav__sub-item"><a style="min-width: fit-content" href="${pageContext.request.contextPath}/views/add-feliere.jsp" class="button">Ajouter Feliere</a></li>
              </ul>
            </li>
        </ul>
    </header-->
    <!--main class="cd-main-content">
      <nav class="cd-side-nav js-cd-side-nav">
          <ul class="cd-side__list js-cd-side__list">
              <li class="cd-side__label"><span>Main</span></li>
              <%
                  for(Departement departement : departements){
              %>
              <li class="cd-side__item cd-side__item--has-children cd-side__item--comments js-cd-item--has-children">
                  <a class="" href="${pageContext.request.contextPath}?departement=<%=departement.getId()%>"><%=departement.getLibelle()%></a>
                  <ul class="cd-side__sub-list">
                      <%
                          String departementId = request.getParameter("departement");
                          if(departementId != null){
                              felieres = Connect.toFelieres(Connect.select("SELECT F.id, F.libelle, D.id as 'departementId', D.libelle as 'departement' FROM feliere F INNER JOIN departement D on D.id = F.departement WHERE F.departement = " + departementId));
                              for (Feliere feliere: felieres) {
                      %>
                      <li class="feliere-item <%= (request.getParameter("feliere") != null) && (request.getParameter("feliere").equals(String.valueOf(feliere.getId()))) ? "feliere-active" : ""  %>">
                          <a class="px-[32] py-[7px] rounded-[16px] bg-main" href="${pageContext.request.contextPath}?departement=<%=departementId%>&feliere=<%=feliere.getId()%>"><%=feliere.getLibelle()%></a>
                      </li>
                      <%
                              }
                          }
                      %>
                  </ul>
              </li>
              <% } %>
              <li class="cd-side__btn"><button class="reset" href="#0">+ Button</button></li>
          </ul>
      </nav>
  </main-->
    <div class="header" style="gap: 10px">
        <div style="gap: 10px">
            <a href="${pageContext.request.contextPath}/views/etudiants.jsp" class="navbar-link">Etudiant</a>
            <a href="${pageContext.request.contextPath}/views/departements.jsp" class="navbar-link">Departements</a>
            <a href="${pageContext.request.contextPath}/views/felieres.jsp" class="navbar-link">Felieres</a>
        </div>
        <a href="${pageContext.request.contextPath}/views/admin.jsp" class="navbar-link">Ddministration</a>
    </div>
    <div class="">
        <div class="content">
            <div class="sidebar">
                <%
                    for(Departement departement : departements){
                %>
                <div class="departement-item <%= (request.getParameter("departement") != null) && (request.getParameter("departement").equals(String.valueOf(departement.getId()))) ? "departement-active" : ""  %>">
                    <a class="" href="${pageContext.request.contextPath}?departement=<%=departement.getId()%>"><%=departement.getLibelle()%></a>
                </div>
                <% } %>
            </div>
            <div class="feliere-list">
                <%
                    String departementId = request.getParameter("departement");
                    if(departementId != null){
                        felieres = Connect.toFelieres(Connect.select("SELECT F.id, F.libelle, D.id as 'departementId', D.libelle as 'departement' FROM feliere F INNER JOIN departement D on D.id = F.departement WHERE F.departement = " + departementId));
                        for (Feliere feliere: felieres) {
                %>
                <div class="feliere-item <%= (request.getParameter("feliere") != null) && (request.getParameter("feliere").equals(String.valueOf(feliere.getId()))) ? "feliere-active" : ""  %>">
                    <a class="px-[32] py-[7px] rounded-[16px] bg-main" href="${pageContext.request.contextPath}?departement=<%=departementId%>&feliere=<%=feliere.getId()%>"><%=feliere.getLibelle()%></a>
                </div>
                <%
                        }
                    }
                %>
            </div>

            <div class="students-section">
                <div class="searchbar">
                    <form action="${pageContext.request.contextPath}/recherche" method="POST">
                        <label for="search">Rechercher Un Etudiant</label>
                        <input  id="search" name="search" type="text" />
                        <input class="recherche-btn" type="submit" value="rechercher">
                    </form>
                </div>
                <%
                    String feliereId = request.getParameter("feliere");
                    if(feliereId != null){
                %>
                <table>
                    <thead>
                        <th>CNE</th>
                        <th>Nom</th>
                        <th>Prenom</th>
                        <th>Telephone</th>
                        <th>Feliere</th>
                        <th>Departement</th>
                    </thead>
                    <tbody>
                        <%
                            String query = "SELECT E.cne, E.nom, E.prenom, E.telephone, D.libelle as 'departement', F.libelle as 'feliere', F.id as 'feliereId', D.id as 'departementId' FROM etudiant E INNER JOIN feliere F ON F.id = E.feliere INNER JOIN departement D on D.id = F.departement where F.id = " + feliereId;
                                etudiants = Connect.toEtudiants(Connect.select(query));
                                for (Etudiant etudiant: etudiants) {
                        %>
                        <tr>
                            <td><%=etudiant.getCNE()%></td>
                            <td><%=etudiant.getNom()%></td>
                            <td><%=etudiant.getPrenom()%></td>
                            <td><%=etudiant.getTelephone()%></td>
                            <td><%=etudiant.getFeliere().getLibelle()%></td>
                            <td><%=etudiant.getDepartement().getLibelle()%></td>
                        </tr>
                        <%
                                }
                        %>
                    </tbody>
                </table>
            </div>
            <% } %>
        </div>
    </div>
</div>
</body>
</html>