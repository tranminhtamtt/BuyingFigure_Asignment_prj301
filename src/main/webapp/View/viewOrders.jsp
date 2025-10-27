<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Đơn hàng đã được chấp nhận</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body class="bg-dark text-light">
        <div class="container py-5">
            <h2>📦 Đơn hàng của bạn</h2>
            <table class="table table-dark table-striped align-middle mt-3">
                <thead>
                    <tr>
                        <th>Ảnh</th>
                        <th>Tên sản phẩm</th>
                        <th>Số lượng</th>
                        <th>Tổng tiền</th>
                        <th>Loại sản phẩm</th>
                        <th>Trạng thái</th>
                    </tr>
                </thead>
                <tbody>
                    <%
       List<Map<String, Object>> orderList = (List<Map<String, Object>>) request.getAttribute("orderList");
       if (orderList != null && !orderList.isEmpty()) {
           for (Map<String, Object> order : orderList) {
                    %>
                    <tr>
                        <td><img src="<%= order.get("imageUrl") %>" width="80"></td>
                        <td><%= order.get("name") %></td>
                        <td><%= order.get("quantity") %></td>
                        <td><%= order.get("total") %> VND</td>
                        <td><%= order.get("productTable") %></td>
                        <%
                            if ("Đã chấp nhận".equals(order.get("status"))) {
                        %>
                        <td><span class="badge bg-success"><%= order.get("status") %></span></td>
                            <%
                                } else {
                            %>
                        <td><span class="badge bg-danger"><%= order.get("status") %></span></td>
                            <%
                                }
                            %>
                    </tr>
                    <%
                            }
                        } else {
                    %>
                    <tr><td colspan="6" class="text-center">⛔ Chưa có đơn hàng nào được admin chấp nhận.</td></tr>
                    <%
                        }
                    %>

                </tbody>
            </table>
            <a href="home" class="btn btn-light mt-3">⬅ Quay lại trang chủ</a>
        </div>
    </body>
</html>
