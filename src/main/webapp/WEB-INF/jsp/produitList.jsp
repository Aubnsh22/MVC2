# ✅ **Version avec Bootstrap (même design que login)**

```jsp
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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-dark">

<div class="container py-4">
    <div class="card bg-black text-white p-4 rounded-4 shadow-lg">
        
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h1 class="text-white mb-0">Gestion des Produits</h1>
            <div>
                <span class="text-white me-3">Utilisateur: ${sessionScope.user}</span>
                <a href="user?action=logout" class="btn btn-danger">Se deconnecter</a>
            </div>
        </div>
        
        <hr class="bg-secondary">

        <!-- Message produit trouve -->
        <c:if test="${not empty produitTrouve}">
            <div class="alert alert-success">
                Produit trouve : ${produitTrouve.nom} - ${produitTrouve.prix} DH - ${produitTrouve.description}
            </div>
        </c:if>

        <!-- Rechercher -->
        <div class="mb-4">
            <h3 class="text-white">Rechercher un produit</h3>
            <form action="produit" method="get" class="row g-2">
                <input type="hidden" name="action" value="search">
                <div class="col-auto">
                    <input type="number" name="id" class="form-control bg-dark text-white border-secondary" placeholder="ID" required>
                </div>
                <div class="col-auto">
                    <input type="submit" value="Rechercher" class="btn btn-primary">
                </div>
            </form>
        </div>

        <hr class="bg-secondary">

        <!-- Ajouter -->
        <div class="mb-4">
            <h3 class="text-white">Ajouter un produit</h3>
            <form action="produit" method="post">
                <input type="hidden" name="action" value="add">
                <div class="mb-3">
                    <label class="form-label text-white">Nom</label>
                    <input type="text" name="nom" class="form-control bg-dark text-white border-secondary" required>
                </div>
                <div class="mb-3">
                    <label class="form-label text-white">Prix</label>
                    <input type="number" step="0.01" name="prix" class="form-control bg-dark text-white border-secondary" required>
                </div>
                <div class="mb-3">
                    <label class="form-label text-white">Description</label>
                    <input type="text" name="description" class="form-control bg-dark text-white border-secondary" required>
                </div>
                <button type="submit" class="btn btn-primary">Ajouter</button>
            </form>
        </div>

        <hr class="bg-secondary">

        <!-- Modifier -->
        <c:if test="${not empty produitAModifier}">
            <div class="mb-4">
                <h3 class="text-white">Modifier le produit (ID: ${produitAModifier.id})</h3>
                <form action="produit" method="post">
                    <input type="hidden" name="action" value="update">
                    <input type="hidden" name="id" value="${produitAModifier.id}">
                    <div class="mb-3">
                        <label class="form-label text-white">Nom</label>
                        <input type="text" name="nom" value="${produitAModifier.nom}" class="form-control bg-dark text-white border-secondary" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label text-white">Prix</label>
                        <input type="number" step="0.01" name="prix" value="${produitAModifier.prix}" class="form-control bg-dark text-white border-secondary" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label text-white">Description</label>
                        <input type="text" name="description" value="${produitAModifier.description}" class="form-control bg-dark text-white border-secondary" required>
                    </div>
                    <button type="submit" class="btn btn-warning">Enregistrer les modifications</button>
                </form>
            </div>
            <hr class="bg-secondary">
        </c:if>

        <!-- Liste -->
        <div>
            <h3 class="text-white">Liste des produits</h3>
            
            <c:if test="${empty produits}">
                <p class="text-white">Aucun produit enregistre.</p>
            </c:if>
            
            <c:if test="${not empty produits}">
                <table class="table table-dark table-bordered">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Nom</th>
                            <th>Prix</th>
                            <th>Description</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${produits}" var="p">
                            <tr>
                                <td>${p.id}</td>
                                <td>${p.nom}</td>
                                <td>${p.prix} DH</td>
                                <td>${p.description}</td>
                                <td>
                                    <a href="produit?action=edit&id=${p.id}" class="btn btn-sm btn-warning">Modifier</a>
                                    <a href="produit?action=delete&id=${p.id}" class="btn btn-sm btn-danger" onclick="return confirm('Supprimer ce produit ?')">Supprimer</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </c:if>
        </div>
        
    </div>
</div>

</body>
</html>
```