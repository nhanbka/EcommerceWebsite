/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entity.EmarketUser;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

/**
 *
 * @author Dell
 */
@WebServlet(name = "manager_user", urlPatterns = {"/manager_user"})
public class manager_user extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet manager_user</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet manager_user at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (request.getParameter("page") != null) {
            if (request.getParameter("page").equals("manager_user")) {
                ArrayList<EmarketUser> listUser = EmarketUser.getListEmarketUser();
                request.setAttribute("listUser", listUser);
                request.getRequestDispatcher("manager_user.jsp").forward(request, response);
            }
        }
        if (request.getParameter("Edit") != null) {
            String productID = request.getParameter("Edit");
            EmarketUser emarketUser = EmarketUser.getUserById(productID);
            request.setAttribute("user", emarketUser);
            request.getRequestDispatcher("editUser.jsp").forward(request, response);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        Context initContext;
        try {
            initContext = new InitialContext();
            Context envContext = (Context) initContext.lookup("java:comp/env");
            DataSource ds = (DataSource) envContext.lookup("jdbc/eMarket");
            try {
                HttpSession session;
                session = request.getSession();
                Connection conn = ds.getConnection();
                String id = request.getParameter("user_id");
                String userRole = request.getParameter("userRole");
                String name = request.getParameter("name");
                String password = request.getParameter("password");
                int registerPossibility = EmarketUser.updateUserInformation(name, Integer.parseInt(userRole), id, password);
                if(registerPossibility == 1){
                    request.getRequestDispatcher("admin.jsp").forward(request, response);
                }
                else {
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                }
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        } catch (NamingException ex) {
            Logger.getLogger(Register.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
