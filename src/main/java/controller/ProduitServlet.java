package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.IProduitDao;
import dao.ProduitDaoImp;
import model.Produit;


@WebServlet("/produit")
public class ProduitServlet extends HttpServlet {
	
	private IProduitDao produitDao;
	
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
		
		String action = request.getParameter("action");
		
		if(action == null) {
			action = "list";
		}
		
		switch (action) {
		case "delete":
			supprimerProduit(request,response);
			break;
		case "search":
			rechercherProduit(request,response);
			break;
		case "edit":
			afficherFormulaireModifier(request,response);
			break;
		default :listerProduits(request,response);
		break;
			
		}
	}
		
		@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
			
	        String action = request.getParameter("action");
	        
	        if("add".equals(action)) {
	        	ajouterProduit(request,response);
	        } else if ("update".equals(action)) {
	        	modifierProduit(request, response);
	        }
	        
	        
			
		}
		
	@Override
	public void init() {
		    produitDao = new ProduitDaoImp();
		}
	private void ajouterProduit(HttpServletRequest request, HttpServletResponse response) throws IOException{
		
		String nom = request.getParameter("nom");
		double prix = Double.parseDouble(request.getParameter("prix"));
		String description = request.getParameter("description");
		
		Produit produit = new Produit(nom,prix,description);
		produitDao.ajouter(produit);
		
		response.sendRedirect("produit?action=list");
		
		
		
	}
	
	
	private void listerProduits(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
		List<Produit> produits = produitDao.ListerTousLesProduits();
		request.setAttribute("produits", produits);
		request.getRequestDispatcher("/WEB-INF/jsp/produitList.jsp").forward(request, response);
		
		
		
		
	}
	
	 private void supprimerProduit(HttpServletRequest request, HttpServletResponse response)
	            throws IOException {
		 Long id = Long.parseLong(request.getParameter("id"));
		 produitDao.supprimer(id);
		 response.sendRedirect("produit?action=list");
		 
		 
	 }
	 
	 private void rechercherProduit(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
	        Long id = Long.parseLong(request.getParameter("id"));
	        Produit produit = produitDao.TrouverProduitParId(id);
	        request.setAttribute("produitTrouve", produit);
	        listerProduits(request,response);
	 }

	 private void afficherFormulaireModifier(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
	        Long id = Long.parseLong(request.getParameter("id"));
	        Produit produit = produitDao.TrouverProduitParId(id);
	        request.setAttribute("produitAModifier", produit);
	        listerProduits(request, response);
	 }

	 private void modifierProduit(HttpServletRequest request, HttpServletResponse response) throws IOException {
	        Long id = Long.parseLong(request.getParameter("id"));
	        String nom = request.getParameter("nom");
	        double prix = Double.parseDouble(request.getParameter("prix"));
	        String description = request.getParameter("description");
	        
	        Produit produit = new Produit();
	        produit.setId(id);
	        produit.setNom(nom);
	        produit.setPrix(prix);
	        produit.setDescription(description);
	        
	        produitDao.modifier(produit);
	        
	        response.sendRedirect("produit?action=list");
	 }
	
}
