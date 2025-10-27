package Dao;

import Model.Product;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProducNhuaDao {

    private String jdbcURL = "jdbc:sqlserver://localhost:1433;databaseName=PaperModelsDB;encrypt=true;trustServerCertificate=true;";
    private String jdbcUser = "sa";       // sửa theo user SQL Server của bạn
    private String jdbcPass = "sa"; // sửa password

    // Lấy Connection
    protected Connection getConnection() {
        Connection conn = null;
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            conn = DriverManager.getConnection(jdbcURL, jdbcUser, jdbcPass);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return conn;
    }

    public Product getProductById(int id) {
        Product product = null;
        String sql = "SELECT id, name, category, imageUrl, difficulty, pages, price FROM ProductsNhua WHERE id = ?";

        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    product = new Product();
                    product.setId(rs.getInt("id"));
                    product.setName(rs.getString("name"));
                    product.setCategory(rs.getString("category"));
                    product.setImageUrl(rs.getString("imageUrl"));
                    product.setDifficulty(rs.getString("difficulty"));
                    product.setPages(rs.getInt("pages"));
                    product.setPrice(rs.getInt("price"));
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return product; // trả về null nếu không tìm thấy
    }

    // Lấy tất cả sản phẩm
    public List<Product> getAllProducts() {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT id, name, category, imageUrl, difficulty, pages, price FROM ProductsNhua";
        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("id"));
                p.setName(rs.getString("name"));
                p.setCategory(rs.getString("category"));
                p.setImageUrl(rs.getString("imageUrl"));
                p.setDifficulty(rs.getString("difficulty"));
                p.setPages(rs.getInt("pages"));
                p.setPrice(rs.getInt("price"));
                list.add(p);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Product> searchProducts(String keyword) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT id, name, category, imageUrl, difficulty, pages, price FROM ProductsNhua WHERE name LIKE ?";

        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, "%" + keyword + "%");
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Product p = new Product();
                    p.setId(rs.getInt("id"));
                    p.setName(rs.getString("name"));
                    p.setCategory(rs.getString("category"));
                    p.setImageUrl(rs.getString("imageUrl"));
                    p.setDifficulty(rs.getString("difficulty"));
                    p.setPages(rs.getInt("pages"));
                    p.setPrice(rs.getInt("price"));
                    list.add(p);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }

    public List<Product> getProductsByPriceRange(int minPrice, int maxPrice) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT id, name, category, imageUrl, difficulty, pages, price "
                + "FROM ProductsNhua WHERE price BETWEEN ? AND ? ORDER BY price ASC";

        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, minPrice);
            ps.setInt(2, maxPrice);

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Product p = new Product();
                    p.setId(rs.getInt("id"));
                    p.setName(rs.getString("name"));
                    p.setCategory(rs.getString("category"));
                    p.setImageUrl(rs.getString("imageUrl"));
                    p.setDifficulty(rs.getString("difficulty"));
                    p.setPages(rs.getInt("pages"));
                    p.setPrice(rs.getInt("price"));
                    list.add(p);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

}
