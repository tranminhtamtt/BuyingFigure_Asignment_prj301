<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, Model.Product"%>
<!doctype html>
<html lang="vi" data-bs-theme="dark">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Kết quả tìm kiếm — PaperModels</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="Css/Style.css" rel="stylesheet">
</head>
<body>
    <!-- NAVBAR -->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark sticky-top shadow-sm">
            <div class="container">
                <a class="navbar-brand d-flex align-items-center" href="home"><span class="logo me-2">PaperModels</span><small class="text-muted">Mô hình giấy</small></a>

                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#mainNav" aria-controls="mainNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="mainNav">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item"><a class="nav-link" href="home">Home</a></li>

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

                        <li class="nav-item"><a class="nav-link" href="#hot">Hot Products</a></li>
                        <li class="nav-item"><a class="nav-link" href="#guides" data-bs-toggle="modal" data-bs-target="#guidesModal">Guides</a></li>
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
    <a class="btn btn-accent btn-sm" id="loginBtn" href="View/login.jsp">Log in</a>
<%
    }
%>


                    </div>
                </div>
            </div>
        </nav>
    <!-- Navbar giống home.jsp -->
    <%-- Bạn có thể include navbar nếu muốn --%>
    
    <div class="container mt-5">
        <h3>Kết quả tìm kiếm cho: "<%= request.getAttribute("query") != null ? request.getAttribute("query") : "" %>"</h3>
        <div class="row g-3 mt-3">
            <%
                List<Product> products = (List<Product>) request.getAttribute("products");
                if (products != null && !products.isEmpty()) {
                    for (Product p : products) {
                        String cat = p.getCategory().replaceAll("[ –]", "");
            %>
            <div class="col-12 col-sm-6 col-md-4 col-lg-3">
                <a href="productDetailServlet?id=<%=p.getId()%>" class="text-decoration-none text-light">
                    <div class="card product-card bg-dark text-light h-100" data-category="<%=cat%>" data-title="<%=p.getName()%>">
                        <img src="<%=p.getImageUrl()%>" class="card-img-top" alt="<%=p.getName()%>">
                        <div class="card-body d-flex flex-column">
                            <h5 class="card-title"><%=p.getName()%></h5>
                            <p class="card-text text-muted small">Difficulty: <%=p.getDifficulty()%> · Pages: <%=p.getPages()%></p>
                            <div class="mt-auto d-flex justify-content-between align-items-center">
                                <div class="d-flex gap-1">
                                    <span class="tag"><%=cat%></span>
                                </div>
                                <div>
                                    <button class="btn btn-sm btn-outline-light fav-toggle" data-id="p<%=p.getId()%>">❤</button>
                                    <button class="btn btn-sm btn-accent ms-1">Download</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </a>
            </div>
            <% 
                    }
                } else {
            %>
            <div class="col-12">
                <p class="text-light">Không tìm thấy sản phẩm nào.</p>
            </div>
            <% } %>
        </div>
    </div>

    <!-- Footer -->
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
</body>
</html>
