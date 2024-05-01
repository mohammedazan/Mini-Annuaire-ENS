
<%@ page import="com.lpw.annuaire.modals.Departement" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="com.lpw.annuaire.modals.Feliere" %>
<%@ page import="com.lpw.annuaire.modals.Etudiant" %>
<%@ page import="com.lpw.annuaire.configs.Connect" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    if(!Connect.open()){
    	System.out.println("Class not found ");
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
  <title>Mini Annuaire ENS </title>
</head>
<body>
<div class="page-wrapper">
    <div class="header" style="gap: 10px">
      <div style="gap: 10px">
          <a href="${pageContext.request.contextPath}/views/etudiants.jsp" class="navbar-link">Etudiant</a>
          <a href="${pageContext.request.contextPath}/views/felieres.jsp" class="navbar-link">Felieres</a>
          <a href="${pageContext.request.contextPath}/views/departements.jsp" class="navbar-link">Departements</a>

      </div>
        <a href="${pageContext.request.contextPath}/views/admin.jsp" class="navbar-link">Administration</a>
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
                        <input class="recherche-btn" type="submit" value="Rechercher">
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
                            String query = "SELECT E.cne, E.nom, E.prenom, E.telephone, D.libelle as 'departement', F.libelle as 'feliere', F.id as 'feliereId', D.id as 'departementId' FROM etudiant E INNER JOIN feliere F ON F.id = E.feliere INNER JOIN departements D on D.id = F.departement where F.id = " + feliereId;
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