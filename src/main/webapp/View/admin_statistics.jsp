<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Thống kê hệ thống</title>
    <style>
        body {
            background: #121212;
            color: #eee;
            font-family: "Segoe UI", Arial;
            padding: 30px;
        }
        h2 {
            color: #00bcd4;
        }
        .stats-container {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 25px;
            margin-top: 30px;
        }
        .card {
            background: #1f1f1f;
            border-radius: 10px;
            padding: 25px;
            box-shadow: 0 0 10px #000;
            text-align: center;
        }
        .card h3 {
            color: #0af;
            margin-bottom: 10px;
        }
        .value {
            font-size: 1.8rem;
            color: #fff;
        }
    </style>
</head>
<body>
    <h2>📊 Tổng quan hệ thống</h2>
    <div class="stats-container">
        <div class="card">
            <h3>Người dùng</h3>
            <div class="value"><%= request.getAttribute("totalUsers") %></div>
        </div>
        <div class="card">
            <h3>Sản phẩm</h3>
            <div class="value"><%= request.getAttribute("totalProducts") %></div>
        </div>
        <div class="card">
            <h3>Đơn hàng</h3>
            <div class="value"><%= request.getAttribute("totalOrders") %></div>
        </div>
        <div class="card">
            <h3>Doanh thu</h3>
            <div class="value"><%= String.format("%,.0f", request.getAttribute("totalRevenue")) %>.000 VND</div>
        </div>
    </div>
</body>
</html>
