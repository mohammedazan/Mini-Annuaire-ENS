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
		<title>Add departement | mini annuaire</title>
		<link rel="stylesheet" href="../styles/styles.css">
	</head>
	<body>
	<div class="header" style="gap: 10px">
		<a href="${pageContext.request.contextPath}/views/admin.jsp" class="navbar-link">administration</a></li>
	</div>
		<div class="container">
			<h1 class="heading">Ajouter un departement</h1>
			<a
				class="consult-button button"
				href="/departements"
				>affichie departements</a
			>
			<form
					method="post"
				action="/mini_annuaire_web_war_exploded/save_departement"
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
