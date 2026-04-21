<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    if (session.getAttribute("user") != null) {
        response.sendRedirect("produit?action=list");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Connexion</title>
</head>
<body>

    <h2>Se connecter</h2>

    <form action="user" method="post">
        <input type="hidden" name="action" value="login">
        Nom d'utilisateur: <input type="text" name="username" required><br><br>
        Mot de passe: <input type="password" name="password" required><br><br>
        <input type="submit" value="Se connecter">
    </form>

    <hr>
    <p>Pas encore de compte ? <a href="signup.jsp">Creer un compte</a></p>

</body>
</html>