package Controller; // chú ý: nên dùng controller viết thường để thống nhất

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;
import java.io.IOException;
import java.util.List;
import Model.Product;
import Dao.ProductDAO;

@WebServlet("/searchServlet")
public class SearchServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String query = request.getParameter("query");
        ProductDAO dao = new ProductDAO();
        List<Product> products;

        if (query != null && !query.trim().isEmpty()) {
            products = dao.searchProducts(query); // lấy kết quả tìm kiếm
        } else {
            products = dao.getAllProducts(); // nếu query rỗng, show tất cả
        }

        request.setAttribute("products", products);
        request.setAttribute("query", query); // để hiển thị lại từ khóa
        request.getRequestDispatcher("/View/search.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
