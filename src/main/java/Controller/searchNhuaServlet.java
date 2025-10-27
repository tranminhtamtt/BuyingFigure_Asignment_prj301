/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Dao.ProducNhuaDao;
import Dao.ProductDAO;
import Model.Product;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "searchNhuaServlet", urlPatterns = {"/searchnhua"})
public class searchNhuaServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String query = request.getParameter("query");
        ProducNhuaDao dao = new ProducNhuaDao();
        List<Product> products;

        if (query != null && !query.trim().isEmpty()) {
            products = dao.searchProducts(query); // lấy kết quả tìm kiếm
        } else {
            products = dao.getAllProducts(); // nếu query rỗng, show tất cả
        }

        request.setAttribute("products", products);
        request.setAttribute("query", query); // để hiển thị lại từ khóa
        request.getRequestDispatcher("/View/searchNhua.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
