package dao;

import model.Produit;

import java.util.*;
public interface IProduitDao {
	
	void ajouter (Produit p);
	
	void supprimer(Long id);
	
	void modifier (Produit p);
	
	Produit TrouverProduitParId(Long Id);
	
	List<Produit> ListerTousLesProduits();
	
	
	
	
	
}
