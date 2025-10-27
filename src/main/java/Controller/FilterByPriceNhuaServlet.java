package Controller;

import Dao.ProducNhuaDao;
import Dao.ProductDAO;
import Model.Product;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;
import java.io.IOException;
import java.util.List;

@WebServlet("/filterbypricenhua")
public class FilterByPriceNhuaServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int min = Integer.parseInt(request.getParameter("min"));
        int max = Integer.parseInt(request.getParameter("max"));
        request.setAttribute("minPrice", min);
        request.setAttribute("maxPrice", max);

        ProducNhuaDao dao = new ProducNhuaDao();
        List<Product> list = dao.getProductsByPriceRange(min, max);

        request.setAttribute("products", list);
        RequestDispatcher rd = request.getRequestDispatcher("View/filterByPriceNhua.jsp");
        rd.forward(request, response);
    }
}
