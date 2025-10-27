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

@WebServlet("/AdminViewOrdersServlet")
public class AdminViewOrdersServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("View/login.jsp");
            return;
        }

        List<Map<String, Object>> orderList = new ArrayList<>();

        try (Connection conn = DBConnect.getConnection()) {
            // ✅ Lấy danh sách đơn hàng từ bảng orders
            String sql = """
                SELECT id, user_id, product_id, quantity, total, product_table, status
                FROM orders
                ORDER BY id DESC
            """;

            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                int orderId = rs.getInt("id");
                int userId = rs.getInt("user_id");
                int productId = rs.getInt("product_id");
                int quantity = rs.getInt("quantity");
                double total = rs.getDouble("total");
                String productTable = rs.getString("product_table");
                String status = rs.getString("status");

                // ✅ Truy vấn bảng sản phẩm tương ứng (tùy product_table)
                String productSql = "";
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
                    item.put("user_id", userId);
                    item.put("name", rsProduct.getString("name"));
                    item.put("imageUrl", rsProduct.getString("imageUrl"));
                    item.put("quantity", quantity);
                    item.put("total", total);
                    item.put("status", status);
                    item.put("productTable", productTable);
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
        request.getRequestDispatcher("View/adminViewOrders.jsp").forward(request, response);
    }
}
