<%@ page import="java.util.ArrayList" %>
<%@ page import="com.lpw.annuaire.modals.Feliere" %>
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
		<title>Add departement | mini annuaire</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/styles/styles.css">
	</head>
	<body>
	<div class="header" style="gap: 10px">
		<a href="${pageContext.request.contextPath}/views/admin.jsp" class="navbar-link">administration</a></li>
	</div>
		<div class="container">
			<h1 class="heading">Ajouter un etudiant</h1>
			<a
				class="consult-button button"
				href="${pageContext.request.contextPath}/"
				>affichie etudiants</a
			>
			<form
					method="post"
					action="${pageContext.request.contextPath}/save_etudiant"
				class="form flex-col">
				<div class="row">
					<div class="field">
						<label for="cne">CNE: </label>
						<input
							id="cne"
							name="cne"
							type="text"
							class="text-input" />
					</div>
					<div class="field">
						<label for="nom">Nom: </label>
						<input
							id="nom"
							name="nom"
							type="text"
							class="text-input" />
					</div>
				</div>
				<div class="row">
					<div class="field">
						<label for="prenom">Prenom: </label>
						<input
							id="prenom"
							name="prenom"
							type="text"
							class="text-input" />
					</div>
					<div class="field">
						<label for="tele">Telephone: </label>
						<input
							id="tele"
							name="tele"
							type="text"
							class="text-input" />
					</div>
				</div>
				<div class="row">
					<div class="field">
						<label for="feliere">Feliere: </label>
						<select
							name="feliere"
							id="feliere">
							<!-- <option value="1">ddd</option> -->
							<% ArrayList<Feliere> felieres = Connect.toFelieres(Connect.select("SELECT F.id, F.libelle, D.libelle as 'departement', D.id as 'departementId' FROM feliere F INNER JOIN departement D on D.id = F.departement;"));
								
								for (Feliere f: felieres) {
									%>
										<option value="<%=f.getId()%>"><%=f.getLibelle()%></option>
									<%
								}
							%>
						</select>
					</div>
					<input
						style="margin-top: 20px"
						type="submit"
						value="enregistrer"
						class="button" />
				</div>
			</form>
		</div>
	</body>
</html>
1
