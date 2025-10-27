<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, Model.Product"%>
<!doctype html>
<html lang="vi" data-bs-theme="dark">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Paper Models — Mô hình giấy</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
        <link href="Css/Style.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css"/>
 <style>
            header {
                margin-top:  50px; /* điều chỉnh tùy chiều cao navbar thực tế */
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
                background: url('https://i.pinimg.com/1200x/ad/98/52/ad98528d33b2f21342a6e34956b2de75.jpg') no-repeat center center;
                background-size: cover;
                opacity: 0.2; /* độ mờ, chỉnh từ 0.1 → 0.9 */
                z-index: -1; /* đặt sau nội dung */
            }

            h2 {
                text-align:center;
                margin:30px 0;
                color:#ffca28;
            }

 .swiper {
    width: 100%;
    max-width: 100%;
    margin: -15 0;
    padding: 20px 0;
    background: transparent; /* trong suốt hoàn toàn */
    transition: opacity 0.3s ease, filter 0.3s ease;
    /* backdrop-filter: blur(10px); */ /* bỏ nếu không muốn làm mờ các phần phía sau */
}


.swiper-slide {
    text-align: center;
    display: flex;
    flex-direction: column;
    align-items: center;
    transition: transform 0.4s ease, opacity 0.4s ease;
    opacity: 0.5; /* các slide bên cạnh mờ */
}

.swiper-slide-active {
    transform: scale(1.1); /* slide giữa to hơn */
    opacity: 1; /* slide giữa rõ nét */
}

.swiper-slide img {
    width: 1000px;
    height: 450px;
    display: block;
    border-radius: 12px;
    object-fit: cover;
}

.swiper-slide a {
    text-decoration: none;
    color: #e9eef8;
}

.swiper22nek {
    text-align: center;
    display: flex;
    flex-direction: column;
    align-items: center;
}

.swiper22nek img {
    width: 240px;
    height: 300px;
    display: block;
    border-radius: 10px;
    object-fit: cover;
}

.swiper22nek a {
    text-decoration: none;
    color: #e9eef8;
}

.swiper-button-next, .swiper-button-prev {
    color: #ffca28;
    background: rgba(0, 0, 0, 0.3);
    padding: 10px 14px;
    border-radius: 50%;
    top: 50%;
    transform: translateY(-50%);
    transition: background 0.3s;
}

.swiper-button-next:hover, .swiper-button-prev:hover {
    background: rgba(0, 0, 0, 0.6);
}

.swiper-pagination-bullet {
    background: #ffca28;
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
    <body class="page-transition">
<canvas id="snowCanvas"></canvas>
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark sticky-top shadow-sm">
            <div class="container">
                                <img src="img/sss.png" alt="PaperModels Logo" 
         class="me-2" style="height:60px;">
                <a class="navbar-brand d-flex align-items-center fw-bold" href="home">
                    <span class="logo me-2 text-accent">PaperModels</span>
                    <small class="text-muted"> Mô hình nhựa </small>
                </a>

                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#mainNav"    
                        aria-controls="mainNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="mainNav">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link" href="homenhua">Home</a>
                        </li>

                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="productsDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                Products
                            </a>
                            <ul class="dropdown-menu border-0 shadow-lg" aria-labelledby="productsDropdown">
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
                        <li class="nav-item"><a class="nav-link" href="https://www.facebook.com/groups/MohinhgiayVN/" >Community</a></li>
                    </ul>

                    <form class="d-flex me-3" role="search" method="get" action="searchnhua">
                        <input id="searchInput" class="form-control form-control-sm me-2" type="search" name="query" placeholder="Tìm mẫu..." aria-label="Search">
                        <button class="btn btn-outline-light btn-sm" type="submit">Search</button>
                    </form>

                    <div class="d-flex align-items-center">
                         <a href="viewFavor" title="Favorites (bấm để xem)">
                            <button class="btn btn-outline-light btn-sm me-2">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-heart-fill" viewBox="0 0 16 16">
                                <path fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z"/>
                                </svg>
                            </button>
                        </a>
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

                <!-- 🔹 Nút xem sản phẩm đã mua -->
                <a href="viewOrders" class="btn btn-outline-light btn-sm rounded-pill px-3 shadow-sm ms-2" style="font-size: 0.9rem;">
                    📦 Sản phẩm đã mua
                </a>
            </div>
        </div>



        <div class="sanpham text-center my-4">
            <p>Mô hình nhựa mới nhất</p>
        </div>

<div class="swiper mySwiper">
  <div class="swiper-wrapper">
    <%
        List<Product> products = (List<Product>) request.getAttribute("products");
        if(products != null){
            // Lấy 6 sản phẩm mới nhất theo index cuối cùng (mới nhất)
            int size = products.size();
            int start = (size >= 6) ? size - 6 : 0;
            for(int i=start; i<size; i++){
                Product p = products.get(i);
    %>
    <div class="swiper-slide">
      <a href="productDetailNhuaServlet?id=<%=p.getId()%>">
        <img src="<%=p.getImageUrl()%>" alt="<%=p.getName()%>">
        <div style="text-align:center; margin-top:5px;">
            <strong><%=p.getName()%></strong><br>
            Giá: <%=p.getPrice()%>.000 VNĐ
        </div>
      </a>
    </div>
    <% 
            } 
        } 
    %>
  </div>

  <!-- Nút điều hướng -->
  <div class="swiper-button-next"></div>
  <div class="swiper-button-prev"></div>

  <!-- Pagination -->
  <div class="swiper-pagination"></div>
</div>
<header class="py-3 text-center">
    <div class="container">
        <h1 class="display-6 mb-1" style="font-size: 1.5rem;">PaperModels — Thế giới mô hình giấy/Mô hình nhựa tỷ lệ:</h1>
        <p class="lead text-muted" style="font-size: 0.9rem;">Mẫu giấy cho Anime, Kiến trúc, Đồ chơi, Xe cộ, Poster và nhiều hơn nữa. Tải xuống, in và gấp!</p>
    </div>
</header>
        <div class="sanpham text-center my-4">
            <p>Sản phẩm nhựa</p>
        </div>

        <div class="container-fluid mb-4">
            <div class="row g-3">
                <div class=" filterbyc col-12 col-md-1  p-3  shadow-sm" id="filterSidebar">
                    <h6 class="text-light mb-2">Filter by Category</h6>
                    <div class="d-flex flex-column gap-2">
                        <button class="btn btn-sm btn-light filter-btn active" data-filter="all">All</button>
                        <button class="btn btn-sm btn-light filter-btn" data-filter="AnimeGame">Anime – Game</button>
                        <button class="btn btn-sm btn-light filter-btn" data-filter="Architecture">Architecture</button>
                        <button class="btn btn-sm btn-light filter-btn" data-filter="Festival">Festival</button>
                        <button class="btn btn-sm btn-light filter-btn" data-filter="ObjectsToys">Objects – Toys</button>
                        <button class="btn btn-sm btn-light filter-btn" data-filter="Animals-Plants">Animals – Plants</button>
                        <button class="btn btn-sm btn-light filter-btn" data-filter="Vehicles">Vehicles</button>
                        <button class="btn btn-sm btn-light filter-btn" data-filter="Celebrities">Celebrities</button>
                        <button class="btn btn-sm btn-light filter-btn" data-filter="Minecraft">Minecraft</button>
                        <button class="btn btn-sm btn-light filter-btn" data-filter="Tools">Tools</button>
                        <button class="btn btn-sm btn-light filter-btn" data-filter="COMBO">COMBO</button>
                        <button class="btn btn-sm btn-light filter-btn" data-filter="PaperDolls">Paper Dolls</button>
                        <button class="btn btn-sm btn-light filter-btn" data-filter="Dollhouses">Dollhouses</button>
                        <button class="btn btn-sm btn-light filter-btn" data-filter="Cubebox">Cubebox</button>
                        <button class="btn btn-sm btn-light filter-btn" data-filter="Poster">Poster</button>
                        <button class="btn btn-sm btn-light filter-btn" data-filter="Postcard">Postcard</button>
                        <button class="btn btn-sm btn-light filter-btn" data-filter="ColoringPages">Coloring Pages</button>
                    </div>
                    <div class="price-filter mb-3">
                        <label class="form-label text-light">Lọc theo giá:</label>
                         <input type="hidden" id="typeFigure" data-value="1">

                        <div class="range-container position-relative">
                            <input type="range" class="form-range" id="minPriceRange" min="0" max="1000" step="50" value="100">
                            <input type="range" class="form-range" id="maxPriceRange" min="0" max="1000" step="50" value="900">
                        </div>

                        <div class="d-flex justify-content-between text-light mt-2">
                            <span>Giá từ: <span id="minPrice">100</span></span>
                            <span>Đến: <span id="maxPrice">900</span></span>
                        </div>

                        <button id="applyPriceFilter" class="btn btn-sm btn-accent mt-2">Lọc sản phẩm</button>
                    </div>
                </div>

                <div class="col-12 col-md-9  p-3  shadow-sm rounded" id="productsContent">
                    <div id="productsGrid" class="row g-3 p-3">
                        <main class="container mb-5">
                            <div id="productsGrid" class="row g-3">
                                <%
                                    List<Product> list = (List<Product>) request.getAttribute("products");
                                    int totalProducts = (list != null) ? list.size() : 0; // tổng số sản phẩm
                                %>

                                <div>
                                    <div class="badge bg-secondary sanpham">
                                        <span class="total">Tổng: <%= totalProducts %></span>
                                    </div>
                                    <div id="productsGrid" class="row g-3">
                                        <%
                                            if(list != null){
                                                int count = 0;  
                                                for(Product p : list){
                                                    if(count >= 12) break; // chỉ hiển thị 8 sản phẩm
                                                    String cat = p.getCategory().replaceAll("[ –]", ""); 
                                        %>
                                        <div class="col-12 col-sm-6 col-md-4 col-lg-3">
                                            <div class="card product-card bg-dark text-light h-100"
                                                 data-name="<%=p.getName()%>"
                                                 data-img="<%=p.getImageUrl()%>"
                                                 data-difficulty="<%=p.getDifficulty()%>"
                                                 data-pages="<%=p.getPages()%>"
                                                 data-category="<%=cat%>"
                                                 data-desc="Mô tả chi tiết sản phẩm <%=p.getDescription()%>"
                                                 data-price="<%=p.getPrice()%>">

                                                <a href="productDetailNhuaServlet?id=<%=p.getId()%>" class="text-decoration-none text-light">
                                                    <img src="<%=p.getImageUrl()%>" class="card-img-top" alt="<%=p.getName()%>">
                                                    <div class="zoom-icon">
                                                        🔍  
                                                        <span class="zoom-text">Giữ chuột để xem chi tiết</span>
                                                    </div>
                                                </a>

                                                <div class="card-body d-flex flex-column">
                                                    <h5 class="card-title"><%=p.getName()%></h5>
                                                    <p class="card-text text-muted small">
                                                        Difficulty: <%=p.getDifficulty()%> · Pages: <%=p.getPages()%>
                                                    </p>
                                                    <div class="mt-auto d-flex justify-content-between align-items-center">
                                                        <div class="d-flex gap-1">
                                                            <span class="tag"><%=cat%></span>
                                                        </div>
                                                        <div>
                                                            <form action="addFavor" method="post" class="d-inline">
                                                                <input type="hidden" name="productId" value="<%= p.getId() %>">
                                                                <input type="hidden" name="quantity" value="1">
                                                                <input type="hidden" name="table" value="productsNhua">
                                                                <button class="btn btn-sm btn-outline-light fav-toggle">❤</button>
                                                            </form>
                                                            <a href="productDetailNhuaServlet?id=<%=p.getId()%>" class="text-decoration-none text-light">
                                                                <button class="btn btn-sm btn-accent ms-1">Tải tệp</button>
                                                            </a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <% count++; } } %>
                                    </div>
                                </div>
                            </div>
                        </main>

                        <div id="productOverlay" class="overlay">
                            <div class="overlay-content">
                                <span class="close-btn">&times;</span>
                                <div class="overlay-body">
                                    <img id="overlay-img" src="" alt="">
                                    <div class="overlay-info">
                                        <h2 id="overlay-title"></h2>
                                        <p id="overlay-meta"></p>
                                        <p id="overlay-desc"></p>
                                        <p id="overlay-price"></p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="container text-end mb-4">
                        <a href="sanphamnhua" class="btn btn-accent d-inline-flex align-items-center gap-2">
                            Xem tất cả sản phẩm
                            <i class="bi bi-arrow-right-short"></i>
                        </a>
                    </div>
                </div>
            </div>
        </div>


    <div class="sanpham text-center my-4">
            <p>Mô hình nhựa chất lượng nhất! Hot!!</p>
        </div> 
<div class="swiper mySwiper">
  <div class="swiper-wrapper">
    <%
        if(products != null){
            // Sắp xếp sản phẩm giảm dần theo giá
            products.sort((a, b) -> Double.compare(b.getPrice(), a.getPrice())); 

            int size = products.size();
            int count = (size >= 10) ? 10 : size; // lấy tối đa 5 sản phẩm đắt nhất
            for(int i = 0; i < count; i++){
                Product p = products.get(i);
    %>
    <div class="swiper-slide swiper22nek">
      <a href="productDetailNhuaServlet?id=<%=p.getId()%>">
        <img src="<%=p.getImageUrl()%>" alt="<%=p.getName()%>">
        <div style="text-align:center; margin-top:5px;">
            <strong><%=p.getName()%></strong><br>
            Giá: <%=p.getPrice()%>.000 VNĐ
        </div>
      </a>
    </div>
    <%
            }
        }
    %>
  </div>

  <!-- Nút điều hướng -->
  <div class="swiper-button-next"></div>
  <div class="swiper-button-prev"></div>

  <!-- Pagination -->
  <div class="swiper-pagination"></div>
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
        <script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>
 <script>
  const swiper = new Swiper(".mySwiper", {
    effect: 'coverflow',          // hiệu ứng coverflow 3D
    grabCursor: true,
    centeredSlides: true,          // slide giữa luôn nằm giữa
    slidesPerView: 3,
    loop: true,
    spaceBetween: 30,
    coverflowEffect: {
        rotate: 30,               // góc nghiêng slide
        stretch: 0,               // khoảng cách kéo dài
        depth: 200,               // độ sâu 3D
        modifier: 1,              // độ mạnh hiệu ứng
        slideShadows: true        // bóng mờ bên cạnh slide
    },
    navigation: {
        nextEl: ".swiper-button-next",
        prevEl: ".swiper-button-prev"
    },
    pagination: {
        el: ".swiper-pagination",
        clickable: true
    },
    autoplay: {
        delay: 3000,
        disableOnInteraction: false
    },
    breakpoints: {
        0: { slidesPerView: 1 },
        600: { slidesPerView: 2 },
        900: { slidesPerView: 3 }
    }
});

// Hover dừng autoplay
const swiperEl = document.querySelector('.mySwiper');
swiperEl.addEventListener('mouseenter', () => swiper.autoplay.stop());
swiperEl.addEventListener('mouseleave', () => swiper.autoplay.start());

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