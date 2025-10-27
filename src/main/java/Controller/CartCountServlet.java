/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Dao.DBConnect;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author ADMIN
 */
@WebServlet("/cartCount")
public class CartCountServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.getWriter().write("{\"status\":\"not_logged_in\",\"cartCount\":0}");
            return;
        }

        try {
            int userId = ((Model.User) session.getAttribute("user")).getId();

            try (Connection conn = DBConnect.getConnection()) {
                PreparedStatement ps = conn.prepareStatement(
                        "SELECT SUM(quantity) AS total FROM cart_items WHERE user_id=?"
                );
                ps.setInt(1, userId);
                ResultSet rs = ps.executeQuery();
                int total = 0;
                if (rs.next()) {
                    total = rs.getInt("total");
                }

                response.getWriter().write("{\"status\":\"ok\",\"cartCount\":" + total + "}");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().write("{\"status\":\"error\",\"cartCount\":0}");
        }
    }
}
