package Controller;

import Dao.ProducNhuaDao;
import Dao.ProductDAO;
import Model.Product;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/hotproduct")
public class HotProductServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        ProductDAO dao = new ProductDAO();
        List<Product> products = dao.getAllProducts();
        ProducNhuaDao dao2 = new ProducNhuaDao();
        List<Product> products2 = dao2.getAllProducts();

        // Sắp xếp giảm dần theo giá
        products.sort((a, b) -> Double.compare(b.getPrice(), a.getPrice()));
        products2.sort((a, b) -> Double.compare(b.getPrice(), a.getPrice()));
        String type = request.getParameter("type");
        // Lưu vào request
        if (type.equalsIgnoreCase("paper")) {
            request.setAttribute("products", products);
            RequestDispatcher rd = request.getRequestDispatcher("View/hotProduct.jsp");
            rd.forward(request, response);
        } else {
            request.setAttribute("products", products2);
            RequestDispatcher rd = request.getRequestDispatcher("View/hotProduct.jsp");
            rd.forward(request, response);
        }

        // Forward sang trang JSP
    }
}
