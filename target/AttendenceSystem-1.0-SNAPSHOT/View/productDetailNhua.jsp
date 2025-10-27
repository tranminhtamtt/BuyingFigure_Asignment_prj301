<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, Model.Product"%>
<!doctype html>
<html lang="vi" data-bs-theme="dark">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Paper Models — Mô hình giấy</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="Css/Style.css" rel="stylesheet">
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
                background: url('https://i.pinimg.com/1200x/ad/98/52/ad98528d33b2f21342a6e34956b2de75.jpg') no-repeat center center;
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
    <body class="page-transition ">
<canvas id="snowCanvas"></canvas>

        <!-- NAVBAR -->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark sticky-top shadow-sm">
            <div class="container">
                                <img src="img/sss.png" alt="PaperModels Logo" 
         class="me-2" style="height:60px;">
                <a class="navbar-brand d-flex align-items-center" href="home"><span class="logo me-2">PaperModels</span><small class="text-muted">Mô hình nhựa</small></a>

                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#mainNav" aria-controls="mainNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="mainNav">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item"><a class="nav-link" href="homenhua">Home</a></li>

                        <!-- Products dropdown -->
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="productsDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">Products</a>
                            <ul class="dropdown-menu" aria-labelledby="productsDropdown">
                                <li><h6 class="dropdown-header">Categories</h6></li>
                                <li><a class="dropdown-item product-cat" data-cat="AnimeGame" href="#">Anime – Game</a></li>
                                <li><a class="dropdown-item product-cat" data-cat="Architecture" href="#">Architecture</a></li>
                                <li><a class="dropdown-item product-cat" data-cat="Festival" href="#">Festival</a></li>
                                <li><a class="dropdown-item product-cat" data-cat="ObjectsToys" href="#">Objects – Toys</a></li>
                                <li><a class="dropdown-item product-cat" data-cat="Animals-Plants" href="#">Animals – Plants</a></li>
                                <li><a class="dropdown-item product-cat" data-cat="Vehicles" href="#">Vehicles</a></li>
                                <li><a class="dropdown-item product-cat" data-cat="Celebrities" href="#">Celebrities</a></li>
                                <li><a class="dropdown-item product-cat" data-cat="Minecraft" href="#">Minecraft</a></li>
                                <li><a class="dropdown-item product-cat" data-cat="Tools" href="#">Tools</a></li>
                                <li><a class="dropdown-item product-cat" data-cat="COMBO" href="#">COMBO</a></li>
                                <li><a class="dropdown-item product-cat" data-cat="PaperDolls" href="#">Paper Dolls</a></li>
                                <li><a class="dropdown-item product-cat" data-cat="Dollhouses" href="#">Dollhouses</a></li>
                                <li><a class="dropdown-item product-cat" data-cat="Cubebox" href="#">Cubebox</a></li>
                                <li><a class="dropdown-item product-cat" data-cat="Poster" href="#">Poster</a></li>
                                <li><a class="dropdown-item product-cat" data-cat="Postcard" href="#">Postcard</a></li>
                                <li><a class="dropdown-item product-cat" data-cat="Coloring-Pages" href="#">Coloring Pages</a></li>
                            </ul>
                        </li>

                        <li class="nav-item"><a class="nav-link" href="hotproduct?type=plastic" target="_blank">Hot Products</a></li>
                       <li class="nav-item"><a class="nav-link" href="View/guide.jsp" target="_blank" >Guides</a></li>
                        <li class="nav-item"><a class="nav-link" href="#community" target="_blank">Community</a></li>
                    </ul>

                    <form class="d-flex me-3" role="search" method="get" action="searchServlet">
                        <input id="searchInput" class="form-control form-control-sm me-2" type="search" name="query" placeholder="Tìm mẫu..." aria-label="Search">
                        <button class="btn btn-outline-light btn-sm" type="submit">Search</button>
                    </form>

                    <div class="d-flex align-items-center">
                        <button id="favoritesBtn" class="btn btn-outline-light btn-sm me-2" title="Favorites (bấm để xem)">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-heart-fill" viewBox="0 0 16 16">
                            <path fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z"/>
                            </svg>
                        </button>
                        <%
                            Model.User user = (Model.User) session.getAttribute("user");
                            if (user != null) {
                        %>
                        <!-- Nếu đã đăng nhập -->
                        <span class="me-2 text-light">Xin chào, <%= user.getUsername() %></span>
                        <a class="btn btn-outline-light btn-sm" href="logout">Logout</a>
                        <%
                            } else {
                        %>
                        <!-- Nếu chưa đăng nhập -->
                        <a class="btn btn-accent btn-sm" id="loginBtn" href="View/login.jsp" target="_blank">Log in</a>
                        <%
                            }
                        %>


                    </div>
                </div>
            </div>
        </nav>
      <div class="bg-dark py-1 shadow-sm">
     
    <div class="container d-flex justify-content-end" style="margin-top: 5px;">
        <a href="cartView" class="btn btn-outline-light btn-sm rounded-pill px-3 shadow-sm position-relative" style="font-size: 0.9rem;">
            🛒 Giỏ hàng
            <span id="cartCount"
                  class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger"
                  style="font-size:0.7rem; padding: 0.25em 0.4em;">
                0
            </span>
        </a>
    </div>
</div>
        <!-- HERO -->
        <header class="py-5 text-center">
            <div class="container">
                <h1 class="display-6 mb-2">PaperModels — Thế giới mô hình giấy/Mô hình nhựa tỷ lệ:</h1>
                <p class="lead text-muted">Mẫu giấy cho Anime, Kiến trúc, Đồ chơi, Xe cộ, Poster và nhiều hơn nữa. Tải xuống, in và gấp!</p>
            </div>
        </header>
    <body>
        <%
    Product product = (Product) request.getAttribute("product");
        %>

        <div class="container py-5">
            <% if (product != null) { %>
            <div class="row product-detail">
                <!-- Ảnh sản phẩm -->
                <div class="col-md-5 text-center mb-4">
                    <img src="<%= product.getImageUrl() %>" class="img-fluid rounded shadow-sm" alt="<%= product.getName() %>">
                </div>

                <!-- Thông tin sản phẩm -->
                <div class="col-md-7">
                    <h2 class="mb-3"><%= product.getName() %></h2>
                    <p class="text-muted">Category: <%= product.getCategory() %></p>
                    <p>Difficulty: <%= product.getDifficulty() %></p>
                    <p>Pages: <%= product.getPages() %></p>
                    <p>Price: <%= product.getPrice() %>.000 VND</p>
                    <p>Description: <%= product.getDescription() %> </p>

                    <div class="mt-4">
                        <form action="cart" method="post" class="d-inline" id="addCartForm">
                            <input type="hidden" name="productId" value="<%= product.getId() %>">
                            <input type="hidden" name="quantity" value="1">
                            <input type="hidden" name="table" value="productsNhua">
                            <button type="submit" class="btn btn-accent btn-lg me-2">Thêm giỏ hàng</button>
                        </form>



                        <a href="#" class="btn btn-accent btn-lg me-2">Mua</a>
                        <a href="homenhua" class="btn btn-light btn-lg">Quay lại</a>
                    </div>
                    <div class="linknn">
                        <p> </p>
                        <a class="linknek" href="https://www.tiktok.com/" >LinkfileDriver.....</a>
                        <a class="linknek" href="https://www.tiktok.com/" >LinkfileFlasher.....</a>
                        <a class="linknek" href="https://www.tiktok.com/" >MegaUp.....</a>
                    </div>
                </div>
            </div>
            <% } else { %>
            <div class="alert alert-warning text-center">
                Sản phẩm không tồn tại.
            </div>
            <div class="text-center mt-3">
                <a href="home" class="btn btn-light">Quay lại Home</a>
            </div>
            <% } %>
        </div>
    <div class="footermoi">
    <footer class="footer bg-dark text-light py-4">
        <div class="container d-flex flex-column flex-md-row justify-content-between align-items-center">
            <div>
                <strong>PaperModels</strong> — Mô hình giấy-Nhựa
                <div class="small text-muted">© 2025 PaperModels. All rights reserved.</div>
            </div>
            <div class="mt-2 mt-md-0 d-flex gap-3">
                <p> Hãy cập nhật với chúng tôi:</p>
                <!-- Facebook -->
                <a href="https://www.facebook.com" target="_blank" class="text-light">
                    <i class="bi bi-facebook" style="font-size: 1.3rem;"></i>
                </a>
                <!-- Instagram -->
                <a href="https://www.instagram.com" target="_blank" class="text-light">
                    <i class="bi bi-instagram" style="font-size: 1.3rem;"></i>
                </a>
              
                <!-- Gmail -->
                <a href="https://www.gmail.com" class="text-light">
                    <i class="bi bi-envelope-fill" style="font-size: 1.3rem;"></i>
                </a>
                <!-- TikTok -->
                <a href="https://www.tiktok.com/" target="_blank" class="text-light">
                    <i class="bi bi-tiktok" style="font-size: 1.3rem;"></i> <!-- Nếu không có sẵn icon, có thể dùng ảnh -->
                </a>
            </div>
        </div>
    </footer>
</div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
        <script src="JavaScript/main.js"></script>
        <script>
            document.addEventListener("DOMContentLoaded", function () {
                document.body.classList.add("show");
            });
        </script>
        <script>
            document.addEventListener("DOMContentLoaded", function () {
                const form = document.getElementById("addCartForm");
                const cartCount = document.getElementById("cartCount");

                // Khi load trang thì gọi API lấy số lượng giỏ hàng
                fetch("cartCount")
                        .then(res => res.json())
                        .then(data => {
                            if (data.status === "ok") {
                                cartCount.innerText = data.cartCount;
                            }
                        });

                // Sự kiện thêm vào giỏ
                form.addEventListener("submit", function (e) {
                    e.preventDefault();

                    const formData = new URLSearchParams(new FormData(form)).toString();

                    fetch("cart", {
                        method: "POST",
                        headers: {"Content-Type": "application/x-www-form-urlencoded"},
                        body: formData
                    })
                            .then(res => res.json())
                            .then(data => {
                                if (data.status === "ok") {
                                    cartCount.innerText = data.cartCount; // luôn lấy từ DB

                                    const toast = document.createElement("div");
                                    toast.innerText = "✔ Thêm vào giỏ hàng thành công!";
                                    toast.className = "toast-msg";
                                    document.body.appendChild(toast);
                                    setTimeout(() => toast.remove(), 2000);
                                } else if (data.status === "not_logged_in") {
                                    window.location.href = "View/login.jsp";
                                } else {
                                    alert("Có lỗi xảy ra, vui lòng thử lại!");
                                }
                            });
                });
            });
        </script>
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