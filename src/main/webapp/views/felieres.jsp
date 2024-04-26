<%@ page import="com.lpw.annuaire.modals.Feliere" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.lpw.annuaire.configs.Connect" %>
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
		<title>Document</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/styles/styles.css">
	</head>
	<body>
	<div class="header" style="gap: 10px">
		<a href="${pageContext.request.contextPath}/" class="navbar-link">home</a></li>
		<a href="${pageContext.request.contextPath}/views/admin.jsp" class="navbar-link">administration</a></li>
	</div>
	<%
		ArrayList<Feliere> felieres;

		if (request.getAttribute("felieres") != null){
			felieres = (ArrayList<Feliere>) request.getAttribute("felieres");
		}else{
			String departement = request.getParameter("departement");
			String query = departement == null ? "SELECT F.id, F.libelle, D.libelle as 'departement', D.id as 'departementId' FROM feliere F INNER JOIN departements D on D.id = F.departement;" 
			: "SELECT F.id, F.libelle, D.libelle as 'departement', D.id as 'departementId' FROM feliere F INNER JOIN departements D on D.id = F.departement where F.departement = " + departement; ;
			felieres = Connect.toFelieres(Connect.select(query));
		}

	%>
		<div class="container">
			<h1 class="heading">List des Felieres</h1>
			<div class="searchbar" style="padding: 40px">
				<form action="${pageContext.request.contextPath}/recherche_feliere" method="POST">
					<label for="search">Rechercher un feliere</label>
					<input  id="search" name="search" type="text" />
					<input class="recherche-btn" type="submit" value="rechercher">
				</form>
			</div>
			<table>
				<thead>
				<th>id</th>
				<th>feliere</th>
				<th>departement</th>
				<th colspan="2">#</th>
				</thead>
				<tbody>
				<%
					for(Feliere feliere : felieres){
				%>
				<tr>
					<td><%=feliere.getId()%></td>
					<td><%=feliere.getLibelle()%></td>
					<td><%=feliere.getDepartement().getLibelle()%></td>
					<td>
						<a
								href="${pageContext.request.contextPath}/?depatement=1&feliere=1"
								class="link"
						>affichier etudiants</a
						>
					</td>
					<td>
						<a
								href="${pageContext.request.contextPath}/delete_feliere?id=<%=feliere.getId()%>"
								class="link"
						>suppremer</a
						>
					</td>
				</tr>
				<% } %>
				</tbody>
			</table>
		</div>
	</body>
</html>
