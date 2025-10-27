package Controller;

import Dao.ProductDAO;
import Model.Product;
import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/sanphamgiay")
public class SanphamgiayServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        ProductDAO dao = new ProductDAO();
        List<Product> list = dao.getAllProducts();
        request.setAttribute("products", list);

        request.getRequestDispatcher("View/sanphamgiay.jsp").forward(request, response);
    }
}
