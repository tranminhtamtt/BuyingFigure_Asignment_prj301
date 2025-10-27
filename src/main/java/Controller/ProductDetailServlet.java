package Controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import Model.Product;
import Dao.ProductDAO;

@WebServlet("/productDetailServlet")
public class ProductDetailServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idStr = request.getParameter("id");
        Product product = null;

        if (idStr != null) {
            int productId = Integer.parseInt(idStr);

            // Lấy sản phẩm từ database hoặc DAO
            ProductDAO dao = new ProductDAO();
            product = dao.getProductById(productId);
        }

        request.setAttribute("product", product);
        request.getRequestDispatcher("/View/productDetail.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
