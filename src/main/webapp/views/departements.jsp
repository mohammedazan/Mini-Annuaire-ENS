<%@ page import="java.util.ArrayList" %>
<%@ page import="com.lpw.annuaire.modals.Departement" %>
<%@ page import="com.lpw.annuaire.configs.Connect" %>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<title>Liste Des Departements</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/styles/styles.css">
	</head>
	<body>

			<div class="header" style="gap: 10px">
				<a href="${pageContext.request.contextPath}/" class="navbar-link">home</a>
				<a href="${pageContext.request.contextPath}/views/admin.jsp" class="navbar-link">administration</a>
			</div>

			<%
				ArrayList<Departement> departements ;

				if (request.getAttribute("departements") != null){
					departements = (ArrayList<Departement>) request.getAttribute("departements");
				}else{
					departements = Connect.toDepartements(Connect.select("SELECT * FROM departement"));
				}
			%>

			<div class="container">
				<h1 class="heading">List Des Departements</h1>
				<div class="searchbar" style="padding: 40px">
					<form action="${pageContext.request.contextPath}/recherche_departement" method="POST">
						<label for="search">Rechercher Un Departement</label>
						<input  id="search" name="searchDepartement" type="text" />
						<input class="recherche-btn" type="submit" value="Rechercher">
					</form>
				</div>
				<table>
					<thead>
					<th>Id</th>
					<th>Departement</th>
					<th>#</th>
					<th></th>
					</thead>
					<tbody>               
					<%
						for(Departement departement : departements){
					%>
					<tr>
						<td><%=departement.getId()%></td>
						<td><%=departement.getLibelle()%></td>
						<td>
							<a
									href="${pageContext.request.contextPath}/?departement=<%=departement.getId()%>"
									class="link"
							>Affichier Felieres</a
							>
						</td>
						<td>
							<a
									href="${pageContext.request.contextPath}/delete_departement?id=<%=departement.getId()%>"
									class="link"
							>Suppremer</a
							>
						</td>
					</tr>

					<% } %>

					</tbody>
				</table>
			</div>
	</body>
</html>
