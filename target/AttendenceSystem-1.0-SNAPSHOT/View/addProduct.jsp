<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Thêm sản phẩm</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body class="bg-dark text-light">
        <div class="container py-5">
            <h2>➕ Thêm sản phẩm mới</h2>
            <form action="<%=request.getContextPath()%>/addProduct" method="post">

                <div class="mb-3">
                    <label class="form-label">Tên sản phẩm</label>
                    <input type="text" name="name" class="form-control" required>
                </div>
                <div class="mb-3">
                    <label class="form-label">Loại </label>
                    <input type="text" name="cat" class="form-control" required>
                </div>
                <div class="mb-3">
                    <label class="form-label">Ảnh (URL)</label>
                    <input type="text" name="imageUrl" class="form-control" required>
                </div>
                <div class="mb-3">
                    <label class="form-label">Difficulty(URL)</label>
                    <input type="text" name="diff" class="form-control" required>
                </div>
                <div class="mb-3">
                    <label class="form-label">Page</label>
                    <input type="text" name="page" class="form-control" required>
                </div>
                <div class="mb-3">
                    <label class="form-label">Giá</label>
                    <input type="number" name="price" class="form-control" required>
                </div>
                <div class="mb-3">
                    <label class="form-label">Chọn loại sản phẩm</label>
                    <select name="table" class="form-select">
                        <option value="products">Sản phẩm Giấy</option>
                        <option value="productsNhua">Sản phẩm Nhựa</option>
                    </select>
                </div>

                <button type="submit" class="btn btn-success">Thêm</button>
                <a href="adminDashboard" class="btn btn-secondary">Hủy</a>
            </form>
        </div>
    </body>
</html>
