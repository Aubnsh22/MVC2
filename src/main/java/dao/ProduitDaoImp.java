package dao;
import utils.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.Transaction;
import model.Produit;
import java.util.*;
import org.hibernate.query.Query;



public class ProduitDaoImp implements IProduitDao {
	
	@Override
	public void ajouter(Produit p) {
		
		Transaction transaction = null;
		try(Session session = HibernateUtil.getSessionFactory().openSession()){
			transaction = session.beginTransaction();
			session.save(p);
			transaction.commit();
			System.out.println("Produit Ajoutée");
		}
		catch(Exception e) {
			if(transaction != null )
				transaction.rollback();
			System.out.println("Probleme"+ e.getMessage());
			e.printStackTrace();
		}
		
	}
	
	@Override
	public void modifier(Produit p) {
		Transaction transaction = null;
		try(Session session = HibernateUtil.getSessionFactory().openSession()){
			transaction = session.beginTransaction();
			session.update(p);
			transaction.commit();
			System.out.println("Modifié");
			
		}
		catch(Exception e) {
			if (transaction != null) 
				transaction.rollback();
            System.err.println("Probleme " + e.getMessage());
            e.printStackTrace();
		}
	
	}
	@Override
	public void supprimer(Long id) {
		Transaction transaction = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();
            Produit produit = session.get(Produit.class, id);
            if (produit != null) {
                session.delete(produit);
                System.out.println("Supprimé");
            } else {
                System.out.println("Prouit non trouvé " + id);
            }
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) 
            	transaction.rollback();
            System.err.println("Probleme" + e.getMessage());
            e.printStackTrace();
        }
	}
	
	@Override
	public Produit TrouverProduitParId(Long Id) {
		try(Session session = HibernateUtil.getSessionFactory().openSession()){
			Produit produit = session.get(Produit.class, Id);
			if(produit != null ){
				System.out.println("Produit trouvé :"+produit.getNom());
			}
			else {
				System.out.println("Produit non trouvé");
			}
			return produit;
		}
		
	}
	
	@Override
	public List<Produit> ListerTousLesProduits(){
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
				Query<Produit> query = session.createQuery("FROM Produit",Produit.class);
				List<Produit> produits = query.list();
				System.out.println("il y'a "+produits.size()+" Produit trouvé");
				return produits;
				
			}
		
		catch (Exception e) {
            System.err.println("Problem " + e.getMessage());
            return new ArrayList<>(); 
        }
	}
	
	

}
