package model;

public class Produit {
	private String nom;
	private Long id;
	private String description;
	private double prix;
	
	
	public Produit() {
        super();
    }
	
	public Produit(String nom,double prix,String description) {
		this.nom = nom;
        this.prix = prix;
        this.description=description;
	}

	public String getNom() {
		return nom;
	}

	public void setNom(String nom) {
		this.nom = nom;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public double getPrix() {
		return prix;
	}

	public void setPrix(double prix) {
		this.prix = prix;
	}
	
	
	
	

}
