/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Connection;
import Dao.DBConnect;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 *
 * @author ADMIN
 */
@WebServlet("/cartView")
public class CartViewServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("View/login.jsp");
            return;
        }

        int userId = ((Model.User) session.getAttribute("user")).getId();
        List<Map<String, Object>> cartItems = new ArrayList<>();

        try (Connection conn = DBConnect.getConnection()) {
            // Lấy danh sách sản phẩm trong giỏ kèm bảng gốc
            PreparedStatement ps = conn.prepareStatement(
                    "SELECT c.id AS cartId, c.quantity, c.product_id, c.product_table "
                    + "FROM cart_items c WHERE c.user_id=?"
            );
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                int cartId = rs.getInt("cartId");
                int productId = rs.getInt("product_id");
                String table = rs.getString("product_table");
                int qty = rs.getInt("quantity");

                // Query sản phẩm từ bảng tương ứng (products hoặc productsNhua)
                String sqlProduct = "SELECT id, name, price, imageUrl FROM " + table + " WHERE id=?";
                PreparedStatement psProd = conn.prepareStatement(sqlProduct);
                psProd.setInt(1, productId);
                ResultSet rsProd = psProd.executeQuery();

                if (rsProd.next()) {
                    Map<String, Object> item = new HashMap<>();
                    item.put("cartId", cartId);
                    item.put("productId", rsProd.getInt("id"));
                    item.put("name", rsProd.getString("name"));
                    item.put("price", rsProd.getDouble("price"));
                    item.put("quantity", qty);
                    item.put("imageUrl", rsProd.getString("imageUrl"));
                    item.put("productTable", table);

                    cartItems.add(item);
                }
            }

            request.setAttribute("cartItems", cartItems);
            request.getRequestDispatcher("View/cartView.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("home");
        }
    }
}
