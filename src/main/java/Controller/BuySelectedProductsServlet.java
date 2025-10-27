package Controller;

import Model.User;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import Dao.DBConnect;

@WebServlet("/buySelectedProducts")
public class BuySelectedProductsServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String[] selectedProducts = request.getParameterValues("selectedProducts");

        HttpSession session = request.getSession(false);
        if (session == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        User user = (User) session.getAttribute("user");
        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        int userId = user.getId();

        if (selectedProducts != null && selectedProducts.length > 0) {
            try (Connection conn = DBConnect.getConnection()) {

                String sql = "INSERT INTO orders (user_id, product_id, quantity, total, product_table) VALUES (?, ?, ?, ?, ?)";
                PreparedStatement ps = conn.prepareStatement(sql);

                for (String productIdStr : selectedProducts) {
                    int productId = Integer.parseInt(productIdStr);
                    int quantity = Integer.parseInt(request.getParameter("quantity_" + productId));
                    double total = Double.parseDouble(request.getParameter("total_" + productId));
                    String productTable = request.getParameter("productTable_" + productId); // ✅ lấy bảng sản phẩm

                    if (productTable == null || productTable.isEmpty()) {
                        productTable = "products"; // mặc định là bảng giấy
                    }

                    ps.setInt(1, userId);
                    ps.setInt(2, productId);
                    ps.setInt(3, quantity);
                    ps.setDouble(4, total);
                    ps.setString(5, productTable);
                    ps.executeUpdate();
                }

                ps.close();
            } catch (Exception e) {
                e.printStackTrace();
                response.getWriter().println("Lỗi khi mua sản phẩm: " + e.getMessage());
                return;
            }
        }

        response.sendRedirect("home");
    }
}
