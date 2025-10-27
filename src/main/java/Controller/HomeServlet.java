// Trong file: HomeServlet.java
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

@WebServlet("/home")
public class HomeServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        ProductDAO dao = new ProductDAO();

        // Lấy tất cả sản phẩm cho phần lưới bên dưới (giữ nguyên)
        List<Product> allProducts = dao.getAllProducts();

        // SỬA Ở ĐÂY: Lấy 5 sản phẩm mới nhất cho banner slider
        // Gửi cả hai danh sách sang JSP
        request.setAttribute("products", allProducts);

        request.getRequestDispatcher("View/home.jsp").forward(request, response);
    }
}
