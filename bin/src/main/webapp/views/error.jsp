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
  <a href="${pageContext.request.contextPath}/" class="navbar-link">home</a>
  <a href="${pageContext.request.contextPath}/views/admin.jsp" class="navbar-link">administration</a>
</div>
<div class="container">
  <h1 class="congrats" style="color: #f61616">${message}</h1>
  <a
          href="${pageContext.request.contextPath}/"
          class="link"
  >Retourne a la page d'acceuill</a
  >
</div>
</body>
</html>
1
