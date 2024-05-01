<%@ page import="java.util.ArrayList" %>
<%@ page import="com.lpw.annuaire.modals.Departement" %>
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
		<title>Add departement | Mini Annuaire</title>
		<link rel="stylesheet" href="../styles/styles.css">
	</head>
	<body>
	<div class="header" style="gap: 10px">
		<a href="${pageContext.request.contextPath}/views/admin.jsp" class="navbar-link">Administration</a></li>
	</div>
		<div class="container">
			<h1 class="heading">Ajouter Un Departement</h1>
			<a
				class="consult-button button"
				href="${pageContext.request.contextPath}/views/departements.jsp" 
				>Affichie Departements</a
			>
			<form
					method="post"
				action="${pageContext.request.contextPath}/save_departement"
				class="form">
				<div class="field">
					<label for="departement">Departement Libelle: </label>
					<input
						id="departement"
						name="libelle"
						type="text"
						class="text-input" />
				</div>
				<input
					type="submit"
					value="enregistrer"
					class="button" />
			</form>
		</div>
	</body>
</html>
1
