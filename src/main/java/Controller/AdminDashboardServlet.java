package Controller;

import Dao.DBConnect;
import java.io.IOException;
import java.sql.*;
import java.util.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/adminDashboard")
public class AdminDashboardServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("View/login.jsp");
            return;
        }

        Model.User user = (Model.User) session.getAttribute("user");
        if (!"admin".equalsIgnoreCase(user.getRole())) {
            response.sendRedirect("home");
            return;
        }

        List<Map<String, Object>> productsGiay = new ArrayList<>();
        List<Map<String, Object>> productsNhua = new ArrayList<>();

        try (Connection conn = DBConnect.getConnection()) {
            // Lấy 10 sản phẩm từ bảng products
            PreparedStatement ps1 = conn.prepareStatement("SELECT  id, name, price, imageUrl FROM products");
            ResultSet rs1 = ps1.executeQuery();
            while (rs1.next()) {
                Map<String, Object> p = new HashMap<>();
                p.put("id", rs1.getInt("id"));
                p.put("name", rs1.getString("name"));
                p.put("price", rs1.getDouble("price"));
                p.put("imageUrl", rs1.getString("imageUrl"));
                p.put("table", "products");
                productsGiay.add(p);
            }

            // Lấy 10 sản phẩm từ bảng productsNhua
            PreparedStatement ps2 = conn.prepareStatement("SELECT  id, name, price, imageUrl FROM productsNhua");
            ResultSet rs2 = ps2.executeQuery();
            while (rs2.next()) {
                Map<String, Object> p = new HashMap<>();
                p.put("id", rs2.getInt("id"));
                p.put("name", rs2.getString("name"));
                p.put("price", rs2.getDouble("price"));
                p.put("imageUrl", rs2.getString("imageUrl"));
                p.put("table", "productsNhua");
                productsNhua.add(p);
            }

            request.setAttribute("productsGiay", productsGiay);
            request.setAttribute("productsNhua", productsNhua);
            request.getRequestDispatcher("View/adminDashboard.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("home");
        }
    }
}
