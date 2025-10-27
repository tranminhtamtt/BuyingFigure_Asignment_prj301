<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Danh sách đơn hàng</title>
    <style>
        body {
            font-family: "Segoe UI", Arial, sans-serif;
            background-color: #121212;
            color: #f0f0f0;
            margin: 0;
            padding: 20px;
        }

        h2 {
            color: #00bcd4;
            text-align: center;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 25px;
            background-color: #1e1e1e;
            border-radius: 8px;
            overflow: hidden;
        }

        th, td {
            border: 1px solid #333;
            padding: 10px;
            text-align: center;
        }

        th {
            background-color: #00bcd4;
            color: #fff;
            font-weight: bold;
        }

        td img {
            width: 60px;
            height: 60px;
            object-fit: cover;
            border-radius: 5px;
        }

        .btn {
            padding: 6px 12px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-weight: 500;
        }

        .accept {
            background-color: #28a745;
            color: white;
        }

        .cancel {
            background-color: #dc3545;
            color: white;
        }

        .no-orders {
            text-align: center;
            color: #aaa;
            padding: 20px;
            font-style: italic;
        }
    </style>
</head>
<body>
    <h2>📦 Danh sách đơn hàng chờ xử lý</h2>

    <table>
        <tr>
            <th>ID</th>
            <th>Người dùng</th>
            <th>Sản phẩm</th>
            <th>Ảnh</th>
            <th>Số lượng</th>
            <th>Tổng tiền (VNĐ)</th>
            <th>Trạng thái</th>
            <th>Hành động</th>
        </tr>

        <%
            List<Map<String, Object>> orderList = (List<Map<String, Object>>) request.getAttribute("orderList");
            boolean hasPending = false;

            if (orderList != null && !orderList.isEmpty()) {
                for (Map<String, Object> order : orderList) {
                    String status = (String) order.get("status");

                    // Bỏ qua đơn hàng đã chấp nhận
                    if ("Đã chấp nhận".equals(status)) {
                        continue;
                    }

                    hasPending = true;
        %>
        <tr>
            <td><%= order.get("id") %></td>
            <td><%= order.get("user_id") %></td>
            <td><%= order.get("name") %></td>
            <td><img src="<%= order.get("imageUrl") %>" alt="Ảnh sản phẩm"></td>
            <td><%= order.get("quantity") %></td>
            <td><%= order.get("total") %>00</td>
            <td><%= status %></td>
            <td>
                <form action="<%= request.getContextPath() %>/UpdateOrderStatusServlet" method="post" style="display:inline;">
                    <input type="hidden" name="orderId" value="<%= order.get("id") %>">
                    <input type="hidden" name="action" value="accept">
                    <button class="btn accept">Chấp nhận</button>
                </form>
                <form action="<%= request.getContextPath() %>/UpdateOrderStatusServlet" method="post" style="display:inline;">
                    <input type="hidden" name="orderId" value="<%= order.get("id") %>">
                    <input type="hidden" name="action" value="cancel">
                    <button class="btn cancel">Hủy</button>
                </form>
            </td>
        </tr>
        <%
                } // end for
                if (!hasPending) {
        %>
        <tr><td colspan="8" class="no-orders">✅ Tất cả đơn hàng đã được xử lý.</td></tr>
        <%
                }
            } else {
        %>
        <tr><td colspan="8" class="no-orders">❌ Không có đơn hàng nào.</td></tr>
        <%
            }
        %>
    </table>
</body>
</html>
