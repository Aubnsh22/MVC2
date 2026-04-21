package utils;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class HibernateUtil {
    
    private static final SessionFactory sessionFactory;
    
    static {
        SessionFactory tempFactory = null;
        try {
            Configuration config = new Configuration();
            config.configure(); // Charge hibernate.cfg.xml
            tempFactory = config.buildSessionFactory();
            System.out.println("SessionFactory initialisee avec succes !");
        } catch (Throwable ex) {
            System.err.println("ERREUR Hibernate: " + ex.getMessage());
            ex.printStackTrace(); // Affiche l'erreur complète
            throw new ExceptionInInitializerError(ex);
        }
        sessionFactory = tempFactory;
    }
    
    public static SessionFactory getSessionFactory() {
        return sessionFactory;
    }
    
    public static void shutdown() {
        if (sessionFactory != null) {
            sessionFactory.close();
        }
    }
}