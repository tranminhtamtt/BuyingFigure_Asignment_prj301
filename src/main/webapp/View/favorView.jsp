<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Sản phẩm yêu thích</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            color: #e9eef8;
            position: relative;
            z-index: 0; 
        }

        /* Lớp background mờ */
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
    <h2>Sản phẩm bạn yêu thích:</h2>
    <table class="table table-dark table-striped align-middle">
        <thead>
            <tr>
                <th>Ảnh</th>
                <th>Tên sản phẩm</th>
                <th>Giá</th>
               
                <th>Hành động</th>
            </tr>
        </thead>
        <tbody>
        <%
            List<Map<String, Object>> favourItems = (List<Map<String, Object>>) request.getAttribute("favourItems");
            if (favourItems != null && !favourItems.isEmpty()) {
                for (Map<String, Object> item : favourItems) {
                    int qty = (int) item.get("quantity");
                    double price = Double.parseDouble(item.get("price").toString());
        %>
            <tr>
                <td><img src="<%= item.get("imageUrl") %>" width="80"></td>
                <td><%= item.get("name") %></td>
                <td><%= price %>00 VND</td>
                
                <td>
                    <form action="removeFavor" method="post" style="display:inline;">
                        <input type="hidden" name="favourId" value="<%= item.get("favourId") %>">
                        <button type="submit" class="btn btn-sm btn-danger">Xóa</button>
                    </form>
                </td>
            </tr>
        <%
                }
            } else {
        %>
            <tr>
                <td colspan="5" class="text-center">Chưa có sản phẩm yêu thích</td>
            </tr>
        <%
            }
        %>
        </tbody>
    </table>

    <a href="home" class="btn btn-light">⬅ Quay lại mua sắm</a>
</div>

</body>
</html>
