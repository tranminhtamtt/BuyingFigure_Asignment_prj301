<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <title>Hướng dẫn - PaperModels</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
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
            }
    .guide-header {
      background: linear-gradient(135deg, #343a40, #212529);
      color: #fff;
      padding: 60px 0;
      text-align: center;
    }
    .guide-section {
      padding: 50px 0;
    }
   .guide-section h3 {
    color: #000; /* chữ đen */
    margin-bottom: 20px;
}

.step {
    background: #fff;
    border-radius: 12px;
    box-shadow: 0 4px 10px rgba(0,0,0,0.1);
    padding: 20px;
    margin-bottom: 20px;
    transition: transform 0.2s;
    color: #000; /* chữ bên trong box cũng đen */
}
  </style>
</head>
<body>

  <!-- Header -->
  <header class="guide-header">
    <h1>Hướng dẫn làm Mô hình giấy</h1>
    <p class="lead">Các bước cơ bản để bắt đầu với PaperModels</p>
  </header>

  <!-- Nội dung -->
  <main class="container">

    <section class="guide-section">
      <h3>1. Chuẩn bị</h3>
      <div class="step">
        <p>- Máy in (khuyến nghị in màu A4).</p>
        <p>- Giấy in (giấy cứng A4: 150 – 200gsm).</p>
        <p>- Dụng cụ: kéo/dao rọc giấy, keo dán giấy, thước kẻ, nhíp nhỏ.</p>
      </div>
    </section>

    <section class="guide-section">
      <h3>2. Tải mẫu mô hình</h3>
      <div class="step">
        <p>- Chọn mẫu mô hình trong mục <strong>Products</strong> và nhấn <em>Tải về</em>.</p>
        <p>- File thường ở định dạng PDF hoặc hình ảnh.</p>
      </div>
    </section>

    <section class="guide-section">
      <h3>3. In mẫu</h3>
      <div class="step">
        <p>- In ra trên giấy dày để mô hình cứng cáp hơn.</p>
        <p>- Đảm bảo in đúng tỉ lệ 100% (không phóng to/thu nhỏ).</p>
      </div>
    </section>

    <section class="guide-section">
      <h3>4. Cắt – gấp – dán</h3>
      <div class="step">
        <p>- Cắt theo đường viền liền nét.</p>
        <p>- Gấp theo đường kẻ chấm (gấp vào) và gạch chấm – gạch (gấp ra).</p>
        <p>- Dán theo thứ tự các tab (cạnh có số trùng nhau).</p>
      </div>
    </section>

    <section class="guide-section">
      <h3>5. Hoàn thiện</h3>
      <div class="step">
        <p>- Kiểm tra các cạnh đã dán khít.</p>
        <p>- Có thể phủ lớp keo sữa mỏng bên ngoài để bền hơn.</p>
      </div>
    </section>

    <section class="guide-section">
      <h3>Video minh họa</h3>
      <div class="ratio ratio-16x9">
        <iframe src="https://www.youtube.com/embed/9QvzJLYfduI" 
                title="Paper Model Tutorial" allowfullscreen></iframe>
      </div>
    </section>

  </main>

  <!-- Footer -->
  <footer class="text-center py-4 bg-dark text-white mt-5">
    &copy; 2025 PaperModels. All rights reserved.
  </footer>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
