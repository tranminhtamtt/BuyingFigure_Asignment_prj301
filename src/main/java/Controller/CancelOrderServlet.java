package Controller;

import Dao.DBConnect;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/cancelOrder")
public class CancelOrderServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        String orderIdStr = request.getParameter("orderId");
        if (orderIdStr != null) {
            try (Connection conn = DBConnect.getConnection()) {
                int orderId = Integer.parseInt(orderIdStr);

                String sql = "DELETE FROM orders WHERE id = ?";
                PreparedStatement ps = conn.prepareStatement(sql);
                ps.setInt(1, orderId);
                ps.executeUpdate();

                ps.close();
            } catch (Exception e) {
                e.printStackTrace();
                response.getWriter().println("Lỗi khi hủy sản phẩm: " + e.getMessage());
                return;
            }
        }

        response.sendRedirect("viewOrders"); // Quay lại danh sách sản phẩm đã mua
    }
}
