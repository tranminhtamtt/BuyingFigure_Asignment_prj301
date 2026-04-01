<div align="center">
  <img src="https://img.icons8.com/color/96/java-coffee-cup-logo--v1.png" alt="Java Logo">
  <h1>Paper Models E-Commerce (PRJ301 Assignment)</h1>
  <p>A full-stack Java Web Application for selling Paper Models & Figures. Developed using <b>Java Servlet, JSP, JDBC</b> and <b>SQL Server</b>.</p>

  <a href="https://buyingfigure-asignment-prj301-1.onrender.com/">
    <img src="https://img.shields.io/badge/Live_Demo-Hosted_on_Render-blue?style=for-the-badge&logo=render" alt="Live Demo">
  </a>
  <a href="#">
    <img src="https://img.shields.io/badge/Database-Hosted_on_Somee-lightgrey?style=for-the-badge&logo=microsoftsqlserver" alt="Database">
  </a>
</div>

---

## 📖 GIỚI THIỆU (Description)
Dự án **Paper Models Web Store** là một bài tập thực hành môn học **PRJ301 (Java Web Application Development)**. 

Trang web mô phỏng chức năng của một cửa hàng thương mại điện tử chuyên cung cấp **Mô Hình Giấy** và **Mô Hình Nhựa (Figures)** các loại. Hệ thống có đầy đủ chức năng thao tác với cơ sở dữ liệu trên cả giao diện Khách và Quản trị viên.

## 🚀 LIVE DEMO 
Trang web hiện đã được deploy thực tế lên Cloud:
👉 **[Nhấp để xem Live Web](https://buyingfigure-asignment-prj301-1.onrender.com/)**

## 🛠 TECH STACK (Công nghệ sử dụng)
- **Front-end:** HTML5, CSS3, JSP (JavaServer Pages), Bootstrap.
- **Back-end:** Java EE (Servlet 4.0), Java 17.
- **Database:** Microsoft SQL Server.
- **Deployment & Hosting:** 
  - Backend Web Server: **Render** (Tomcat via Docker)
  - Cloud Database: **Somee.com**

## 🔥 TÍNH NĂNG NỔI BẬT (Features)
- [x] Hiển thị danh sách sản phẩm với nhiều danh mục (Mô hình giấy, Mô hình nhựa...).
- [x] Chi tiết từng sản phẩm (Hình ảnh, độ khó, số trang cắt ghép, giá thành).
- [x] Chức năng Thêm/Xoá Giỏ hàng (Shopping Cart).
- [x] Chức năng Yêu thích (Wishlist).
- [x] Quản lý Đơn hàng cho Khách hàng.
- [x] Dashboard Quản trị và Thống kê Đơn hàng dành cho Admin.
- [x] Xác thực Đăng nhập & Hiển thị thông tin cá nhân.

## 👨‍💻 CHẠY LOCAL TẠI MÁY (Local Setup)
Nếu bạn muốn Fork hoặc kéo dự án về chấm điểm trên môi trường localhost thay vì xem Live Demo:

1. Clone thư mục Repository này về máy:
   ```bash
   git clone https://github.com/tranminhtamtt/BuyingFigure_Asignment_prj301.git
   ```
2. Import thư mục con vào IDE quen thuộc của nhóm (NetBeans, IntelliJ, hoặc Eclipse).
3. (Tùy chọn) Chạy lệnh gen/Script SQL server có sẵn vào MS SQL Server Local. Mở thư mục `src/main/java/Dao/DBConnect.java` để chỉnh lại mật khẩu Localhost nếu cần kiểm thử ngoại tuyến.
4. Clean & Build, sau đó **Run file**. Project sẽ khởi chạy trên Browser thông qua Tomcat Web Server.

---
> 📝 **Lưu ý chấm điểm:** Giao diện Backend (Java) cùng Database (SQL Server) hiện tại đã được cấu hình gộp khối với trang Demo trên Render Cloud hoàn chỉnh. Thầy/Cô có thể vào trực tiếp đường dẫn thẻ Live Demo bên trên để thao tác trải nghiệm chức năng.
