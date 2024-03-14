/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller;

import DAL.CartDAO;
import Model.Cart;
import Model.User;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;

/**
 *
 * @author Admin
 */
@WebServlet(name="cartQuantityControl", urlPatterns={"/cartQuantity"})
public class cartQuantityControl extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
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
            out.println("<title>Servlet cartQuantityControl</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet cartQuantityControl at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        RequestDispatcher requestDispatcher;
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        String action = request.getParameter("action");
        int cartID = Integer.parseInt(request.getParameter("cartID"));
        Cart cart = CartDAO.INSTANCE.getCartByID(cartID);
        int amount = cart.getAmount();
        float totalPrice=0;
        switch (action) {
            case "increase" -> {
                amount++;
                CartDAO.INSTANCE.updateAmount(cart.getCartID(), amount, amount * cart.getProduct().getProductPrice());
                
            }
            case "decrease" -> {
                amount--;
                if (amount == 0) {
                   CartDAO.INSTANCE.deleteCart(cart.getCartID()); 
                } else {
                  CartDAO.INSTANCE.updateAmount(cart.getCartID(), amount, amount * cart.getProduct().getProductPrice());  
                }
                
            }
            case "delete" -> {
                CartDAO.INSTANCE.deleteCart(cart.getCartID());
            }
            default -> throw new AssertionError();
        }
        ArrayList<Cart> cartList = CartDAO.INSTANCE.getCartListByUser(user.getUserID());
        for (Cart cart1 : cartList) {
            totalPrice += cart1.getPrice();

        }
        request.setAttribute("totalPrice", totalPrice);
        request.setAttribute("cartList", cartList);
        requestDispatcher = request.getRequestDispatcher("cart.jsp");
        requestDispatcher.forward(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
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
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}