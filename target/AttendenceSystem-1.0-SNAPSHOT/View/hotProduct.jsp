<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, Model.Product" %>
<html>
<head>
    <title>Hot Products</title>
    
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="Css/Style.css" rel="stylesheet">
        <style>
.card-img-top2 {
    width: 100%;
    height: 400px; 
    object-fit: cover;
}
</style>
        <style>
            #snowCanvas {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    pointer-events: none; /* để click vào trang vẫn bình thường */
    z-index: 9999; /* hiển thị trên tất cả */
}
            body {
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
                background: url('https://i.pinimg.com/736x/b9/70/dd/b970dd507df5c77a482bb490a0394125.jpg') no-repeat center center;
                background-size: cover;
                opacity: 0.2; /* độ mờ, chỉnh từ 0.1 → 0.9 */
                z-index: -1; /* đặt sau nội dung */
            }</style>
        <style>
            .toast-msg {
                position: fixed;
                top: 20px;
                right: 20px;
                background: #28a745;
                color: white;
                padding: 10px 15px;
                border-radius: 8px;
                z-index: 9999;
                animation: fadeInOut 2s;
            }
            @keyframes fadeInOut {
                0% {
                    opacity: 0;
                    transform: translateY(-20px);
                }
                20% {
                    opacity: 1;
                    transform: translateY(0);
                }
                80% {
                    opacity: 1;
                }
                100% {
                    opacity: 0;
                    transform: translateY(-20px);
                }
            }
#snowCanvas {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    pointer-events: none; /* để click vào trang vẫn bình thường */
    z-index: 9999; /* hiển thị trên tất cả */
}

        </style>
</head>
<body class="bg-dark text-light">
    <canvas id="snowCanvas"></canvas>
<div class="container mt-4">
    <h2 class="text-warning text-center">🔥 Hot Products (Giá cao nhất)</h2>
    <div class="row g-3">
        <%
            List<Product> products = (List<Product>) request.getAttribute("products");
            if (products != null) {
                int count = 0;
                for (Product p : products) {
                    if (count >= 12) break; // chỉ lấy top 12
        %>
        <div class="col-md-3">
            <div class="card bg-secondary text-light ">
                <img src="<%=p.getImageUrl()%>" class="card-img-top2" alt="<%=p.getName()%>">

                <div class="card-body">
                    <h5 class="card-title"><%=p.getName()%></h5>
                    <p class="card-text">Giá: <%=p.getPrice()%>.000 VNĐ</p>
                    <a href="productDetailServlet?id=<%=p.getId()%>" class="btn btn-warning btn-sm">Xem chi tiết</a>
                </div>
            </div>
        </div>
        <% count++; } } %>
    </div>
</div>
    <script>
const canvas = document.getElementById("snowCanvas");
const ctx = canvas.getContext("2d");

let w = canvas.width = window.innerWidth;
let h = canvas.height = window.innerHeight;

// Tạo mảng chứa các hạt tuyết
const snowflakes = [];
const snowCount = 100; // số lượng hạt tuyết

for(let i=0; i<snowCount; i++){
    snowflakes.push({
        x: Math.random() * w,
        y: Math.random() * h,
        radius: Math.random() * 3 + 1,
        speed: Math.random() * 1 + 0.5,
        wind: Math.random() * 0.5 - 0.25
    });
}

function drawSnow() {
    ctx.clearRect(0,0,w,h);
    ctx.fillStyle = "white";
    ctx.beginPath();
    snowflakes.forEach(f => {
        ctx.moveTo(f.x, f.y);
        ctx.arc(f.x, f.y, f.radius, 0, Math.PI*2);
    });
    ctx.fill();
    moveSnow();
}

function moveSnow() {
    snowflakes.forEach(f => {
        f.y += f.speed;
        f.x += f.wind;
        if(f.y > h) f.y = -f.radius; // khi xuống dưới quay lên đầu
        if(f.x > w) f.x = 0;
        if(f.x < 0) f.x = w;
    });
}

function animate() {
    drawSnow();
    requestAnimationFrame(animate);
}

animate();

// Resize canvas khi thay đổi kích thước màn hình
window.addEventListener('resize', () => {
    w = canvas.width = window.innerWidth;
    h = canvas.height = window.innerHeight;
});
</script>


</body>
</html>
