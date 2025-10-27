/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Dao.UserDAO;
import Model.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author ADMIN
 */
@WebServlet("/registerServlet")
public class RegisterServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String fullname = request.getParameter("fullname");

        UserDAO userDAO = new UserDAO();
        User user = new User(username, password, email, fullname);

        boolean success = userDAO.registerUser(user);

        if (success) {
            // đăng ký thành công → redirect sang login.jsp
            response.sendRedirect(request.getContextPath() + "/View/login.jsp");
        } else {
            // đăng ký thất bại → quay lại register.jsp và báo lỗi
            request.setAttribute("error", "Đăng ký thất bại! Username có thể đã tồn tại.");
            request.getRequestDispatcher("/View/register.jsp").forward(request, response);
        }

    }
}
