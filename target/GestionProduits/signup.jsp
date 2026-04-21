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
    <title>Inscription</title>
</head>
<body>

    <h2>Creer un compte</h2>

    <form action="user" method="post">
        <input type="hidden" name="action" value="signup">
        Nom d'utilisateur: <input type="text" name="username" required><br><br>
        Mot de passe: <input type="password" name="password" required><br><br>
        <input type="submit" value="S'inscrire">
    </form>

    <hr>
    <p>Vous avez deja un compte ? <a href="login.jsp">Se connecter</a></p>

</body>
</html>