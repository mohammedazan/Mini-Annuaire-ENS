<%--
  Created by IntelliJ IDEA.
  User: abdenassar
  Date: 6/14/23
  Time: 11:53 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>administration</title>
    <link rel="stylesheet" href="../styles/styles.css">
</head>
<body>
<div class="header" style="gap: 10px">
    <a href="${pageContext.request.contextPath}/" class="navbar-link">home</a>
    <a href="${pageContext.request.contextPath}/views/admin.jsp" class="navbar-link">administration</a>
</div>
    <div class="container">
        <div style="display: flex; gap: 20px">
            <a style="min-width: fit-content" href="${pageContext.request.contextPath}/views/add-etudiant.jsp" class="button">ajouter etudiant</a>
            <a style="min-width: fit-content" href="${pageContext.request.contextPath}/views/add-departement.jsp" class="button">ajouter departement</a>
            <a style="min-width: fit-content" href="${pageContext.request.contextPath}/views/add-feliere.jsp" class="button">ajouter feliere</a>
        </div>
    </div>
</body>
</html>
