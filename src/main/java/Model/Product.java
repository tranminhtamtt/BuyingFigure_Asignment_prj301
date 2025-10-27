package Model;

public class Product {

    private int id;
    private String name;
    private String category;
    private String imageUrl;
    private String difficulty;
    private int pages;
    private int price;
    private String description = " – Mô hình giấy 3D\n"
            + "\n"
            + "Mang đến cho bạn trải nghiệm sáng tạo tuyệt vời với mô hình giấy Naruto Uzumaki – nhân vật chính trong bộ truyện và anime đình đám Naruto Shippuden. Sản phẩm được thiết kế chi tiết, sắc nét, với các đường cắt chính xác giúp dễ dàng gấp và lắp ráp.\n"
            + "\n"
            + "Chất liệu: File PDF chất lượng cao, in trên giấy A4 định lượng 180 – 200gsm.\n"
            + "\n"
            + "Kích thước sau khi hoàn thành: cao khoảng 25cm.\n"
            + "\n"
            + "Độ khó: Trung bình (phù hợp cho người mới tập gấp).\n"
            + "\n"
            + "Phụ kiện đi kèm: File hướng dẫn chi tiết từng bước.\n"
            + "\n"
            + "Ứng dụng: Trang trí bàn học, trưng bày sưu tầm, làm quà tặng độc đáo.\n"
            + "\n"
            + "✨ Hãy tự tay lắp ráp Naruto và biến góc học tập của bạn thành một không gian đậm chất anime!";

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    // Constructor không tham số
    public Product() {
    }

    // Getters & Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public String getDifficulty() {
        return difficulty;
    }

    public void setDifficulty(String difficulty) {
        this.difficulty = difficulty;
    }

    public int getPages() {
        return pages;
    }

    public void setPages(int pages) {
        this.pages = pages;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

}
