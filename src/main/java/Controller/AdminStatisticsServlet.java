package Controller;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;
import java.util.*;

@WebServlet("/AdminStatisticsServlet")
public class AdminStatisticsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        int totalUsers = 0;
        int totalOrders = 0;
        int totalProducts = 0;
        double totalRevenue = 0;

        try {
            conn = Dao.DBConnect.getConnection();

            // Tổng người dùng
            ps = conn.prepareStatement("SELECT COUNT(*) FROM users");
            rs = ps.executeQuery();
            if (rs.next()) {
                totalUsers = rs.getInt(1);
            }

            // Tổng sản phẩm
            ps = conn.prepareStatement("SELECT COUNT(*) FROM products");
            rs = ps.executeQuery();
            if (rs.next()) {
                totalProducts = rs.getInt(1);
            }

            // Tổng đơn hàng
            ps = conn.prepareStatement("SELECT COUNT(*) FROM orders");
            rs = ps.executeQuery();
            if (rs.next()) {
                totalOrders = rs.getInt(1);
            }

            // Tổng doanh thu
            ps = conn.prepareStatement("SELECT SUM(total) FROM orders WHERE status = N'Đã chấp nhận'");
            rs = ps.executeQuery();
            if (rs.next()) {
                totalRevenue = rs.getDouble(1);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("totalUsers", totalUsers);
        request.setAttribute("totalProducts", totalProducts);
        request.setAttribute("totalOrders", totalOrders);
        request.setAttribute("totalRevenue", totalRevenue);

        request.getRequestDispatcher("View/admin_statistics.jsp").forward(request, response);
    }
}
