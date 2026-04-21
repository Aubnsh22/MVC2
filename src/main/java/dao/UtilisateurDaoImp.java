package dao;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import model.Utilisateur;
import utils.HibernateUtil;

public class UtilisateurDaoImp {

	public void inscrire(Utilisateur utilisateur) {
		Transaction transaction = null;
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			transaction = session.beginTransaction();
			session.save(utilisateur);
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}
	}

	public Utilisateur login(String username, String password) {
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			Query<Utilisateur> query = session.createQuery("FROM Utilisateur WHERE username = :u AND password = :p", Utilisateur.class);
			query.setParameter("u", username);
			query.setParameter("p", password);
			return query.uniqueResult();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
}