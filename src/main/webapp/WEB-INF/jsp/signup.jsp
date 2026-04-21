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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-dark">

<div class="container d-flex justify-content-center align-items-center vh-100">
    <div class="card bg-black text-white p-4 rounded-4 shadow-lg" style="width: 400px;">
        
        <h2 class="text-center text-white mb-4">Creer un compte</h2>

        <form action="user" method="post">
            <input type="hidden" name="action" value="signup">
            
            <div class="mb-3">
                <label class="form-label text-white">Nom d'utilisateur</label>
                <input type="text" name="username" class="form-control bg-dark text-white border-secondary" required>
            </div>
            
            <div class="mb-3">
                <label class="form-label text-white">Mot de passe</label>
                <input type="password" name="password" class="form-control bg-dark text-white border-secondary" required>
            </div>
            
            <button type="submit" class="btn btn-primary w-100">S'inscrire</button>
        </form>

        <hr class="bg-secondary">

        <p class="text-center mb-0">
            Vous avez deja un compte ? 
            <a href="user?action=login" class="btn btn-success w-100 mt-2">Se connecter</a>
        </p>
    </div>
</div>

</body>
</html>