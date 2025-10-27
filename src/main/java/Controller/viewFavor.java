package Controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import Dao.DBConnect;

@WebServlet("/viewFavor")
public class viewFavor extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("View/login.jsp");
            return;
        }

        int userId = ((Model.User) session.getAttribute("user")).getId();
        List<Map<String, Object>> favourItems = new ArrayList<>();

        try (Connection conn = DBConnect.getConnection()) {

            // Lấy danh sách sản phẩm trong bảng favour
            String sql = "SELECT f.id AS favourId, f.quantity, f.product_id, f.product_table "
                    + "FROM favour f WHERE f.user_id=?";
            try (PreparedStatement ps = conn.prepareStatement(sql)) {
                ps.setInt(1, userId);
                try (ResultSet rs = ps.executeQuery()) {
                    while (rs.next()) {
                        int favourId = rs.getInt("favourId");
                        int productId = rs.getInt("product_id");
                        String table = rs.getString("product_table");
                        int qty = rs.getInt("quantity");

                        // Lấy thông tin sản phẩm từ bảng tương ứng
                        String sqlProduct = "SELECT id, name, price, imageUrl FROM " + table + " WHERE id=?";
                        try (PreparedStatement psProd = conn.prepareStatement(sqlProduct)) {
                            psProd.setInt(1, productId);
                            try (ResultSet rsProd = psProd.executeQuery()) {
                                if (rsProd.next()) {
                                    Map<String, Object> item = new HashMap<>();
                                    item.put("favourId", favourId);
                                    item.put("productId", rsProd.getInt("id"));
                                    item.put("name", rsProd.getString("name"));
                                    item.put("price", rsProd.getDouble("price"));
                                    item.put("quantity", qty);
                                    item.put("imageUrl", rsProd.getString("imageUrl"));
                                    item.put("table", table);
                                    favourItems.add(item);
                                }
                            }
                        }
                    }
                }
            }

            // Gửi danh sách tới JSP
            request.setAttribute("favourItems", favourItems);
            request.getRequestDispatcher("View/favorView.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("home");
        }
    }
}
