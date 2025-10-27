package Filter;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
//"/filterbypricenhua", "/filterbyprice", "/homenhua", "/productDetailNhuaServlet", "/productDetailNhuaServlet", "/productDetailServlet", "/sanphamnhua", "/sanphamgiay", "/searchServlet", "/searchnhua"

@WebFilter({})
public class AuthFilter implements Filter {

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        HttpSession session = req.getSession(false);

        if (session != null && session.getAttribute("user") != null) {
            // đã login
            chain.doFilter(request, response);
        } else {
            // chưa login -> chuyển về login.jsp
            res.sendRedirect(req.getContextPath() + "/View/login.jsp");
        }
    }
}
