package Controller;

import Dao.UserDAO;
import Model.User;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/loginServlet")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        UserDAO userDAO = new UserDAO();
        User user = userDAO.checkLogin(username, password);

        if (user != null) {
            HttpSession session = request.getSession();
            session.setAttribute("user", user);

            // 🔍 In ra log để kiểm tra role thực tế
            System.out.println(">>> Đăng nhập thành công: " + user.getUsername() + " | role: " + user.getRole());

            // Nếu là admin → chuyển thẳng về trang quản trị
            if ("admin".equalsIgnoreCase(user.getRole())) {
                response.sendRedirect("View/admin.jsp");
            } else {
                response.sendRedirect("home");
            }
        } else {
            request.setAttribute("error", "Sai tài khoản hoặc mật khẩu!");
            request.getRequestDispatcher("View/login.jsp").forward(request, response);
        }
    }
}
