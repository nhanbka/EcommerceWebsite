/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entity.Product;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import sessionbean.ProductSessionBean;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "BuyProduct", urlPatterns = {"/BuyProduct"})
public class BuyProduct extends HttpServlet {

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
            out.println("<title>Servlet BuyProduct</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet BuyProduct at " + request.getContextPath() + "</h1>");
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
    @EJB
    private ProductSessionBean productSessionBean;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String productId = request.getParameter("productID");
        HttpSession session = request.getSession();
        if (productId != null) {
            float subTotal = 0;
            Product product = productSessionBean.find(new Integer(productId));
            ArrayList<Product> list;
            list = (ArrayList<Product>) session.getAttribute("cart");
            boolean appear = false;
            if (list != null) {
                for (Product item : list) {
                    if (item.equals(product)) {
                        appear = true;
                    }
                    subTotal += item.getPrice();
                }
            }
            if (!appear) {
                if (list == null) {
                    subTotal += product.getPrice();
                    list = new ArrayList<Product>();
                    list.add(product);
                    session.setAttribute("cart", list);
                    session.setAttribute("subTotal", subTotal);
                } else {
                    list.add(product);
                    session.setAttribute("cart", list);
                    session.setAttribute("subTotal", subTotal);
                }
            }
            if (request.getParameter("addToCart") != null) {
                request.getRequestDispatcher("index.jsp").forward(request, response);
            } else {
                request.getRequestDispatcher("checkout.jsp").forward(request, response);
            }
        }
        if(request.getParameter("transact") != null){
            ArrayList<Product> list = (ArrayList<Product>)session.getAttribute("cart");
            session.removeAttribute("cart");
            request.getRequestDispatcher("finish-transaction.jsp").forward(request, response);
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
        processRequest(request, response);
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
