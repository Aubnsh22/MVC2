<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
    if (session.getAttribute("user") == null) {
        response.sendRedirect("user?action=login");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Gestion des Produits</title>
</head>
<body>

    <h1>Gestion des Produits</h1>
    <p>Utilisateur: ${sessionScope.user} | <a href="user?action=logout">Se deconnecter</a></p>
    <hr>

    <c:if test="${not empty produitTrouve}">
        <p style="color:green">Produit trouve : ${produitTrouve.nom} - ${produitTrouve.prix} DH - ${produitTrouve.description}</p>
    </c:if>

    <h3>Rechercher un produit</h3>
    <form action="produit" method="get">
        <input type="hidden" name="action" value="search">
        ID: <input type="number" name="id" required>
        <input type="submit" value="Rechercher">
    </form>

    <hr>

    <h3>Ajouter un produit</h3>
    <form action="produit" method="post">
        <input type="hidden" name="action" value="add">
        Nom: <input type="text" name="nom" required><br><br>
        Prix: <input type="number" step="0.01" name="prix" required><br><br>
        Description: <input type="text" name="description" required><br><br>
        <input type="submit" value="Ajouter">
    </form>

    <hr>

    <c:if test="${not empty produitAModifier}">
        <h3>Modifier le produit (ID: ${produitAModifier.id})</h3>
        <form action="produit" method="post">
            <input type="hidden" name="action" value="update">
            <input type="hidden" name="id" value="${produitAModifier.id}">
            Nom: <input type="text" name="nom" value="${produitAModifier.nom}" required><br><br>
            Prix: <input type="number" step="0.01" name="prix" value="${produitAModifier.prix}" required><br><br>
            Description: <input type="text" name="description" value="${produitAModifier.description}" required><br><br>
            <input type="submit" value="Enregistrer les modifications">
        </form>
        <hr>
    </c:if>

    <h3>Liste des produits</h3>
    
    <c:if test="${empty produits}">
        <p>Aucun produit enregistre.</p>
    </c:if>
    
    <c:if test="${not empty produits}">
        <table border="1">
            <tr>
                <th>ID</th>
                <th>Nom</th>
                <th>Prix</th>
                <th>Description</th>
                <th>Actions</th>
            </tr>
            <c:forEach items="${produits}" var="p">
                <tr>
                    <td>${p.id}</td>
                    <td>${p.nom}</td>
                    <td>${p.prix} DH</td>
                    <td>${p.description}</td>
                    <td>
                        <a href="produit?action=edit&id=${p.id}">Modifier</a> | 
                        <a href="produit?action=delete&id=${p.id}" onclick="return confirm('Supprimer ce produit ?')">Supprimer</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </c:if>

</body>
</html>