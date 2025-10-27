<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #121212;
            color: #f5f5f5;
        }
        .card img {
            height: 160px;
            object-fit: cover;
        }
    </style>
</head>
<body>
<div class="container py-5">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2>🛠️ Quản lý sản phẩm</h2>
        
        <a href="View/addProduct.jsp" class="btn btn-success">➕ Thêm sản phẩm</a>
    </div>

    <h4 class="mt-4 text-warning">Sản phẩm Giấy</h4>
    <div class="row">
        <%
            List<Map<String, Object>> productsGiay = (List<Map<String, Object>>) request.getAttribute("productsGiay");
            if (productsGiay != null && !productsGiay.isEmpty()) {
                for (Map<String, Object> p : productsGiay) {
        %>
        <div class="col-md-3 mb-4">
            <div class="card bg-dark text-light shadow-sm">
                <img src="<%= p.get("imageUrl") %>" class="card-img-top" alt="product">
                <div class="card-body">
                    <h6 class="card-title"><%= p.get("name") %></h6>
                    <p class="card-text"><%= p.get("price") %>00 VND</p>
                </div>
            </div>
        </div>
        <% } } else { %>
            <p>Không có sản phẩm nào trong bảng này.</p>
        <% } %>
    </div>

    <h4 class="mt-4 text-info">Sản phẩm Nhựa</h4>
    <div class="row">
        <%
            List<Map<String, Object>> productsNhua = (List<Map<String, Object>>) request.getAttribute("productsNhua");
            if (productsNhua != null && !productsNhua.isEmpty()) {
                for (Map<String, Object> p : productsNhua) {
        %>
        <div class="col-md-3 mb-4">
            <div class="card bg-dark text-light shadow-sm">
                <img src="<%= p.get("imageUrl") %>" class="card-img-top" alt="product">
                <div class="card-body">
                    <h6 class="card-title"><%= p.get("name") %></h6>
                    <p class="card-text"><%= p.get("price") %>00 VND</p>
                </div>
            </div>
        </div>
        <% } } else { %>
            <p>Không có sản phẩm nào trong bảng này.</p>
        <% } %>
    </div>

    <a href="home" class="btn btn-light mt-4">⬅ Quay lại trang chủ</a>
</div>
</body>
</html>
