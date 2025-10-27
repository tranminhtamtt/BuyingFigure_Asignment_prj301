package Controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;
import java.io.IOException;
import java.sql.*;
import Dao.DBConnect;

@WebServlet("/addFavor")
public class addFavor extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("View/login.jsp");
            return;
        }

        try {
            int userId = ((Model.User) session.getAttribute("user")).getId();
            int productId = Integer.parseInt(request.getParameter("productId"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));

            String table = request.getParameter("table");
            if (table == null || table.isEmpty()) {

            }

            try (Connection conn = DBConnect.getConnection()) {
                // kiểm tra tồn tại
                PreparedStatement psCheck = conn.prepareStatement(
                        "SELECT id, quantity FROM favour WHERE user_id=? AND product_id=? AND product_table=?"
                );
                psCheck.setInt(1, userId);
                psCheck.setInt(2, productId);
                psCheck.setString(3, table);
                ResultSet rs = psCheck.executeQuery();

                if (rs.next()) {
                    int currentQty = rs.getInt("quantity");
                    try (PreparedStatement psUpdate = conn.prepareStatement(
                            "UPDATE favour SET quantity=? WHERE id=?"
                    )) {
                        psUpdate.setInt(1, currentQty + quantity);
                        psUpdate.setInt(2, rs.getInt("id"));
                        psUpdate.executeUpdate();
                    }
                } else {
                    try (PreparedStatement psInsert = conn.prepareStatement(
                            "INSERT INTO favour(user_id, product_id, quantity, product_table) VALUES(?,?,?,?)"
                    )) {
                        psInsert.setInt(1, userId);
                        psInsert.setInt(2, productId);
                        psInsert.setInt(3, quantity);
                        psInsert.setString(4, table);
                        psInsert.executeUpdate();
                    }
                }

                // lấy tổng số lượng
                PreparedStatement psTotal = conn.prepareStatement(
                        "SELECT SUM(quantity) AS total FROM favour WHERE user_id=?"
                );
                psTotal.setInt(1, userId);
                ResultSet rsTotal = psTotal.executeQuery();
                int total = 0;
                if (rsTotal.next()) {
                    total = rsTotal.getInt("total");
                }
                if (table.equalsIgnoreCase("products")) {
                    response.sendRedirect("home"); // hoặc "home"
                } else {
                    response.sendRedirect("homenhua"); // hoặc "home"
                }

            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("home");
        }
    }
}
