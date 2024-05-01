<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Administration</title>
    <link rel="stylesheet" href="../styles/styles.css">
</head>
<body>
<div class="header" style="gap: 10px">
    <a href="${pageContext.request.contextPath}/" class="navbar-link">Home</a>
    <a href="${pageContext.request.contextPath}/views/admin.jsp" class="navbar-link">Administration</a>
</div>
    <div class="container">
        <div style="display: flex; gap: 20px">
            <a style="min-width: fit-content" href="${pageContext.request.contextPath}/views/add-etudiant.jsp" class="button">Ajouter Etudiant</a>
            <a style="min-width: fit-content" href="${pageContext.request.contextPath}/views/add-departement.jsp" class="button">Ajouter Departement</a>
            <a style="min-width: fit-content" href="${pageContext.request.contextPath}/views/add-feliere.jsp" class="button">Ajouter Feliere</a>
        </div>
    </div>
</body>
</html>
