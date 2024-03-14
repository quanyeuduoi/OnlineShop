/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller;

import DAL.BrandDAO;
import DAL.CategoryDAO;
import DAL.ProductDAO;
import Model.Brand;
import Model.Category;
import Model.Product;
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
@WebServlet(name="searchForCustomer", urlPatterns={"/searchForCustomer"})
public class searchForCustomer extends HttpServlet {
   
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
            out.println("<title>Servlet searchForCustomer</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet searchForCustomer at " + request.getContextPath () + "</h1>");
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
        String productName = request.getParameter("productName");
        RequestDispatcher requestDispatcher;
        HttpSession session = request.getSession();
        int indexDefault = 1;
        int totalProduct;
        int endPage;
        session.setAttribute("indexDefault", indexDefault);
        String indexParameter = request.getParameter("index");
        int index;
        if (indexParameter == null || indexParameter.isEmpty()) {
            // Xử lý khi không có tham số "index" hoặc giá trị là rỗng
            index = indexDefault;
        } else {
            index = Integer.parseInt(indexParameter);
            // Xử lý khi có giá trị hợp lệ cho "index"
        }
        ArrayList<Product> productList = ProductDAO.INSTANCE.searchByProductName(productName, index);
        totalProduct = ProductDAO.INSTANCE.getTotalProductByProductName(productName);
        endPage = totalProduct / 9;
        if (totalProduct % 9 != 0) {
            endPage++; //if the posts in the last page has less than 9, +1 page to include these post
        }
        ArrayList<Category> categoryList = CategoryDAO.INSTANCE.getCategoryList();
        ArrayList<Brand> brandList = BrandDAO.INSTANCE.getBrandList();
        request.setAttribute("categoryList", categoryList);
        request.setAttribute("productName", productName);
        request.setAttribute("brandList", brandList);
        request.setAttribute("index", index);
        request.setAttribute("productList", productList);
        request.setAttribute("endPage", endPage);
        requestDispatcher = request.getRequestDispatcher("productListSearch.jsp");
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
