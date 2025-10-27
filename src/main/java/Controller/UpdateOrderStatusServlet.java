package Controller;

import Dao.DBConnect;
import java.io.IOException;
import java.sql.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/UpdateOrderStatusServlet")
public class UpdateOrderStatusServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {

        String action = request.getParameter("action");
        int orderId = Integer.parseInt(request.getParameter("orderId"));
        String newStatus = "Đang chờ";

        if ("accept".equalsIgnoreCase(action)) {
            newStatus = "Đã chấp nhận";
        } else if ("cancel".equalsIgnoreCase(action)) {
            newStatus = "Đã hủy";
        }

        try (Connection conn = DBConnect.getConnection()) {
            String sql = "UPDATE orders SET status = ? WHERE id = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, newStatus);
            ps.setInt(2, orderId);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Lỗi cập nhật trạng thái đơn hàng: " + e.getMessage());
            return;
        }

        response.sendRedirect("AdminViewOrdersServlet");
    }
}
