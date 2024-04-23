<%@ page import="com.lpw.annuaire.modals.Departement" %>
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
		<title>Add feliere | mini annuaire</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/styles/styles.css">
	</head>
	<body>
	<div class="header" style="gap: 10px">
		<a href="${pageContext.request.contextPath}/views/admin.jsp" class="navbar-link">administration</a></li>
	</div>
		<div class="container">
			<h1 class="heading">Ajouter un feliere</h1>
            <a
				class="button consult-button"
				href="${pageContext.request.contextPath}/views/felieres.jsp"
				>afficher felieres</a
			>
			<form
					method="post"
					action="${pageContext.request.contextPath}/save_feliere"
				class="form">
				<div class="field">
					<label for="feliere">Feliere Libelle: </label>
					<input
                        id="feliere"
						name="libelle"
						type="text"
						class="text-input" />
				</div>
				<div class="departement">
					<label for="departement">Departement: </label>
					<select
							name="departement"
							id="departement">
						<% ArrayList<Departement> departements = Connect.toDepartements(Connect.select("Select * from departement;"));

							for (Departement d: departements) {
						%>
							<option value="<%=d.getId()%>"><%=d.getLibelle()%></option>
						<%
							}
						%>
					</select>
				</div>
				<input
					type="submit"
					value="enregistrer"
					class="button" />
			</form>
		</div>
	</body>
</html>
