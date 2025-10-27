package Controller;

import Dao.ProducNhuaDao;

import Model.Product;
import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/homenhua")
public class HomeNhuaServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        ProducNhuaDao dao = new ProducNhuaDao();
        List<Product> list = dao.getAllProducts();

        request.setAttribute("products", list);

        request.getRequestDispatcher("View/homeNhua.jsp").forward(request, response);
    }
}
