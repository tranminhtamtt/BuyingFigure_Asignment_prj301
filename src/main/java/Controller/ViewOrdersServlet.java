package Controller;

import Dao.DBConnect;
import Model.User;
import java.io.IOException;
import java.sql.*;
import java.util.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/viewOrders")
public class ViewOrdersServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("View/login.jsp");
            return;
        }

        User user = (User) session.getAttribute("user");
        int userId = user.getId();

        List<Map<String, Object>> orderList = new ArrayList<>();

        try (Connection conn = DBConnect.getConnection()) {
            // ✅ Chỉ lấy đơn hàng đã được admin chấp nhận
            String sql = """
                SELECT id, product_id, quantity, total, product_table, status
                FROM orders
                WHERE user_id = ? 
                ORDER BY id DESC
            """;

            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                int orderId = rs.getInt("id");
                int productId = rs.getInt("product_id");
                int quantity = rs.getInt("quantity");
                double total = rs.getDouble("total");
                String productTable = rs.getString("product_table");
                String status = rs.getString("status");

                String productSql;
                if ("productsNhua".equalsIgnoreCase(productTable)) {
                    productSql = "SELECT name, imageUrl FROM productsNhua WHERE id = ?";
                } else {
                    productSql = "SELECT name, imageUrl FROM products WHERE id = ?";
                }

                PreparedStatement psProduct = conn.prepareStatement(productSql);
                psProduct.setInt(1, productId);
                ResultSet rsProduct = psProduct.executeQuery();

                if (rsProduct.next()) {
                    Map<String, Object> item = new HashMap<>();
                    item.put("id", orderId);
                    item.put("name", rsProduct.getString("name"));
                    item.put("imageUrl", rsProduct.getString("imageUrl"));
                    item.put("quantity", quantity);
                    item.put("total", total);
                    item.put("productTable", productTable);
                    item.put("status", status);
                    orderList.add(item);
                }

                rsProduct.close();
                psProduct.close();
            }

            rs.close();
            ps.close();

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Lỗi khi tải đơn hàng: " + e.getMessage());
            return;
        }

        request.setAttribute("orderList", orderList);
        request.getRequestDispatcher("View/viewOrders.jsp").forward(request, response);
    }
}
