package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UtilisateurDaoImp;
import model.Utilisateur;

@WebServlet("/user")
public class UserServlet extends HttpServlet {
    
    private UtilisateurDaoImp utilisateurDao;

    @Override
    public void init() {
        utilisateurDao = new UtilisateurDaoImp();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        
        if ("logout".equals(action)) {
            HttpSession session = request.getSession();
            session.invalidate();
            response.sendRedirect("user?action=login");
        } else if ("signup".equals(action)) {
            request.getRequestDispatcher("/WEB-INF/jsp/signup.jsp").forward(request, response);
        } else {
            request.getRequestDispatcher("/WEB-INF/jsp/login.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        if ("signup".equals(action)) {
            Utilisateur newUser = new Utilisateur(username, password);
            utilisateurDao.inscrire(newUser);
            response.sendRedirect("user?action=login");
        } else if ("login".equals(action)) {
            Utilisateur utilisateur = utilisateurDao.login(username, password);
            
            if (utilisateur != null) {
                HttpSession session = request.getSession();
                session.setAttribute("user", utilisateur.getUsername());
                response.sendRedirect("produit?action=list");
            } else {
                response.sendRedirect("user?action=login");
            }
        }
    }
}