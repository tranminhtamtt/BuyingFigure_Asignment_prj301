<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Giỏ hàng</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <style>
            body {
                margin: 0;
                font-family: Arial, sans-serif;
                color: #e9eef8;
                position: relative;
                z-index: 0;
            }
            body::before {
                content: "";
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background: url('https://i.pinimg.com/1200x/36/19/09/36190987c6cd3c29ec4f1ac202decbf1.jpg') no-repeat center center;
                background-size: cover;
                opacity: 0.2;
                z-index: -1;
            }
        </style>
    </head>
    <body class="bg-dark text-light">

        <div class="container py-5">
            <h2>🛒 Giỏ hàng của bạn</h2>

            <form action="buySelectedProducts" method="post">
                <table class="table table-dark table-striped align-middle">
                    <thead>
                        <tr>
                            <th>Chọn</th>
                            <th>Ảnh</th>
                            <th>Tên sản phẩm</th>
                            <th>Giá</th>
                            <th>Số lượng</th>
                            <th>Thành tiền</th>
                            <th>Hành động</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            List<Map<String, Object>> cartItems = (List<Map<String, Object>>) request.getAttribute("cartItems");
                            if (cartItems != null && !cartItems.isEmpty()) {
                                double total = 0;
                                for (Map<String, Object> item : cartItems) {
                                    int qty = (int) item.get("quantity");
                                    double price = Double.parseDouble(item.get("price").toString());
                                    double subtotal = qty * price;
                                    total += subtotal;
                        %>
                        <tr>
                            <td>
                                <input type="checkbox" name="selectedProducts" value="<%= item.get("productId") %>" class="form-check-input">
                                <input type="hidden" name="quantity_<%= item.get("productId") %>" value="<%= item.get("quantity") %>">
                                <input type="hidden" name="total_<%= item.get("productId") %>" value="<%= (Double.parseDouble(item.get("price").toString()) * (int)item.get("quantity")) %>">
                                
                                <input type="hidden" name="productTable_<%= item.get("productId") %>" value="<%= item.get("productTable") %>">


                            </td>
                            <td><img src="<%= item.get("imageUrl") %>" width="80"></td>
                            <td><%= item.get("name") %></td>
                            <td><%= price %>00 VND</td>
                            <td><%= qty %></td>
                            <td><%= subtotal %>00 VND</td>
                            <td>
                                <form action="removeCart" method="post" style="display:inline;">
                                    <input type="hidden" name="cartId" value="<%= item.get("cartId") %>">
                                    <button type="submit" class="btn btn-sm btn-danger">Xóa</button>
                                </form>
                            </td>
                        </tr>

                        <%
                                }
                        %>
                        <tr>
                            <td colspan="5" class="text-end fw-bold">Tổng cộng:</td>
                            <td colspan="2" class="fw-bold"><%= total %>.000 VND</td>
                        </tr>
                        <%
                            } else {
                        %>
                        <tr>
                            <td colspan="7" class="text-center">Giỏ hàng trống</td>
                        </tr>
                        <%
                            }
                        %>
                    </tbody>
                </table>

                <% if (cartItems != null && !cartItems.isEmpty()) { %>
                <input type="hidden" name="userId" value="<%= ((Model.User)session.getAttribute("user")).getId() %>">
                <button type="submit" class="btn btn-success mt-3">
                    Mua các sản phẩm đã chọn
                </button>
                <% } %>
            </form>

            <a href="home" class="btn btn-light mt-3">⬅ Quay lại mua sắm</a>
        </div>

    </body>
</html>
