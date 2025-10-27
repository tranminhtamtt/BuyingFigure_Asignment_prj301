package Controller;

import Dao.DBConnect;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/addProduct")
public class addProductServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession(false);

        // Kiểm tra quyền admin
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("View/login.jsp");
            return;
        }

        Model.User user = (Model.User) session.getAttribute("user");
        if (!"admin".equalsIgnoreCase(user.getRole())) {
            response.sendRedirect("home");
            return;
        }

        // Lấy dữ liệu từ form
        String name = request.getParameter("name");
        String cat = request.getParameter("cat");
        String imageUrl = request.getParameter("imageUrl");
        String diff = request.getParameter("diff");
        String page = request.getParameter("page");
        double price = Double.parseDouble(request.getParameter("price"));
        String table = request.getParameter("table");

        // Kiểm tra bảng hợp lệ (tránh SQL injection)
        if (!"products".equalsIgnoreCase(table) && !"productsNhua".equalsIgnoreCase(table)) {
            response.sendRedirect("adminDashboard");
            return;
        }

        // Thêm sản phẩm vào bảng tương ứng
        try (Connection conn = DBConnect.getConnection()) {
            String sql = "INSERT INTO " + table + " (name, category, imageUrl, difficulty, pages, price) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, cat);
            ps.setString(3, imageUrl);
            ps.setString(4, diff);
            ps.setString(5, page);
            ps.setDouble(6, price);

            ps.executeUpdate();

            // Quay lại dashboard
            response.sendRedirect("adminDashboard");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("adminDashboard");
        }
    }
}
