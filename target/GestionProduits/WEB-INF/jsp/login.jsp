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
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">

</head>
<body>

    <h2 class="text-primary">Se connecter</h2>

    <form action="user" method="post">
        <input type="hidden" name="action" value="login">
        Nom d'utilisateur: <input type="text" name="username" required><br><br>
        Mot de passe: <input type="password" name="password" required><br><br>
        <input type="submit" value="Se connecter">
    </form>

    <hr>
    <p>Pas encore de compte ? <a href="user?action=signup">Creer un compte</a></p>

</body>
</html>