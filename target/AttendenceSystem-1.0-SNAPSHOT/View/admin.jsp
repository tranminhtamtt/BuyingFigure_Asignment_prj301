<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="Model.User" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Trang Quản Trị</title>
    <style>
        * {
            box-sizing: border-box;
        }
        body {
            font-family: "Segoe UI", Arial, sans-serif;
            background-color: #0e0e0e;
            color: #f5f5f5;
            margin: 0;
        }

        /* ===== HEADER ===== */
        header {
            background: linear-gradient(90deg, #1f1f1f, #2a2a2a);
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 15px 25px;
            border-bottom: 1px solid #333;
        }

        header h1 {
            margin: 0;
            font-size: 1.3rem;
            color: #00bcd4;
        }

        .user-info {
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .user-info span {
            color: #ccc;
        }

        .user-info a {
            background-color: #00bcd4;
            color: #fff;
            padding: 6px 12px;
            border-radius: 5px;
            font-size: 0.9rem;
            text-decoration: none;
            transition: 0.2s;
        }

        .user-info a:hover {
            background-color: #028a9e;
        }

        /* ===== SIDEBAR ===== */
        .sidebar {
            background: #1b1b1b;
            width: 230px;
            height: 90vh;
            padding-top: 20px;
            float: left;
            border-right: 1px solid #333;
            display: flex;
            flex-direction: column;
        }

        .sidebar a {
            display: block;
            padding: 12px 20px;
            color: #bbb;
            text-decoration: none;
            transition: all 0.2s ease;
            border-left: 4px solid transparent;
        }

        .sidebar a:hover {
            background: #222;
            color: #00bcd4;
        }

        .sidebar a.active {
            background: #00bcd4;
            color: #fff;
            font-weight: bold;
            border-left: 4px solid #fff;
        }

        /* ===== MAIN CONTENT ===== */
        .main-content {
            margin-left: 230px;
            height: 90vh;
            background: #121212;
        }

        iframe {
            width: 100%;
            height: 100%;
            border: none;
            background-color: #fff;
        }
    </style>
</head>

<body>
    <%
        User user = (User) session.getAttribute("user");
        if (user != null) {
    %>

    <header>
        <h1>🌐 Bảng Điều Khiển Quản Trị</h1>
        <div class="user-info">
            <% if ("admin".equalsIgnoreCase(user.getRole())) { %>
                <span>Xin chào, <a href="<%= request.getContextPath() %>/home">Admin</a></span>
            <% } else { %>
                <span>Xin chào, <%= user.getUsername() %></span>
            <% } %>
            <a href="<%= request.getContextPath() %>/logout">Đăng xuất</a>
        </div>
    </header>

    <div class="sidebar" id="sidebar">
        <a href="<%= request.getContextPath() %>/AdminViewOrdersServlet" target="mainFrame" class="active">📦 Đơn hàng</a>
        <a href="<%= request.getContextPath() %>/adminDashboard" target="mainFrame">🛒 Quản lý sản phẩm</a>
        <a href="<%= request.getContextPath() %>/AdminStatisticsServlet" target="mainFrame">📊 Thống kê</a>
    </div>

    <div class="main-content">
        <iframe name="mainFrame"></iframe>
    </div>

    <script>
        // 🧠 Khi click vào link trong sidebar → đổi màu active
        const links = document.querySelectorAll('#sidebar a');
        links.forEach(link => {
            link.addEventListener('click', () => {
                links.forEach(l => l.classList.remove('active'));
                link.classList.add('active');
            });
        });
    </script>

    <% } else { %>
        <p style="color: red; text-align: center; margin-top: 50px;">
            Bạn chưa đăng nhập. <a href="login.jsp" style="color:#00bcd4;">Đăng nhập ngay</a>.
        </p>
    <% } %>
</body>
</html>
