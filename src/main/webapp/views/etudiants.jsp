<%@ page import="java.util.ArrayList" %>
<%@ page import="com.lpw.annuaire.modals.Etudiant" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta
          http-equiv="X-UA-Compatible"
          content="IE=edge" />
  <meta
          name="viewport"
          content="width=device-width, initial-scale=1.0" />
  <title>Etudiants</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/styles.css">
</head>
<body>
<div class="header" style="gap: 10px">
  <a href="${pageContext.request.contextPath}/" class="navbar-link">home</a></li>
  <a href="${pageContext.request.contextPath}/views/admin.jsp" class="navbar-link">administration</a></li>
</div>
<div class="container">
  <div class="searchbar">
    <form action="${pageContext.request.contextPath}/recherche" method="POST">
      <label for="search">Rechercher Un Etudiant</label>
      <input  id="search" name="search" type="text" />
      <input class="recherche-btn" type="submit" value="rechercher">
    </form>
  </div>
  <% ArrayList<Etudiant> etudiants = (ArrayList<Etudiant>) request.getAttribute("etudiants"); %>
  <div class="container">
    <h1 class="heading">List des etudiants</h1>
    <table>
      <thead>
      <th>CNE</th>
      <th>Nom</th>
      <th>Prenom</th>
      <th>Telephone</th>
      <th>Departement</th>
      <th colspan="2">#</th>
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
            <%=etudiant.getFeliere().getLibelle()%>
          </a>
        </td>
        <td>
          <a class="link"  href="${pageContext.request.contextPath}/delete_etudiant?cne=<%=etudiant.getCNE()%>">
            suppremer
          </a>
        </td>
      </tr>
      <% } %>
      </tbody>
    </table>
  </div>
</div>

</body>
</html>
