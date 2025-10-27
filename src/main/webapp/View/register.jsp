<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Register - PaperModels</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
      <style>body {
                margin: 0;
                font-family: Arial, sans-serif;
                color: #e9eef8;
                position: relative;
                z-index: 0; /* để nội dung trên lớp overlay */
            }

            /* Lớp background mờ */
            body::before {
                content: "";
                position: fixed; /* để ảnh nền cố định */
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background: url('https://i.pinimg.com/1200x/64/87/42/6487426f021355a3b37eb7ff63c78825.jpg') no-repeat center center;
                
                background-size: cover;
                opacity: 0.2; /* độ mờ, chỉnh từ 0.1 → 0.9 */
                z-index: -1; /* đặt sau nội dung */
            }
      </style>
</head>
<body class="bg-dark text-light">
    <%
    String error = (String) request.getAttribute("error");
    if (error != null) {
%>
    <div class="alert alert-danger text-center">
        <%= error %>
    </div>
<%
    }
%>

<div class="container d-flex justify-content-center align-items-center vh-100">
    <div class="card p-4 shadow-lg" style="min-width: 400px;">
        <h3 class="text-center mb-3">Đăng ký</h3>
        <form method="post" action="<%=request.getContextPath()%>/registerServlet">
            <div class="mb-3">
                <label class="form-label">Tên đăng nhập</label>
                <input type="text" class="form-control" name="username" required>
            </div>
            <div class="mb-3">
                <label class="form-label">Họ và tên</label>
                <input type="text" class="form-control" name="fullname" required>
            </div>
            <div class="mb-3">
                <label class="form-label">Email</label>
                <input type="email" class="form-control" name="email" required>
            </div>
            <div class="mb-3">
                <label class="form-label">Mật khẩu</label>
                <input type="password" class="form-control" name="password" required>
            </div>
            <div class="mb-3">
                <label class="form-label">Nhập lại mật khẩu</label>
                <input type="password" class="form-control" name="confirmPassword" required>
            </div>
            <button type="submit" class="btn btn-accent w-100">Đăng ký</button>
            <p class="mt-2 text-center"><a href="login.jsp">Đã có tài khoản? Đăng nhập</a></p>
        </form>
    </div>
</div>
</body>
</html>
