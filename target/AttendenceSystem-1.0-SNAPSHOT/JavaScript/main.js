// Filter & Search
const filterBtns = document.querySelectorAll('.filter-btn');
const cards = document.querySelectorAll('#productsGrid .col-12');
const totalCount = document.querySelector('.total');

function updateCount() {
    const visible = [...cards].filter(c => c.style.display !== 'none');
    totalCount.textContent = 'Tổng: ' + visible.length;
}

filterBtns.forEach(btn => {
    btn.addEventListener('click', () => {
        filterBtns.forEach(b => b.classList.remove('active'));
        btn.classList.add('active');
        const f = btn.dataset.filter;
        cards.forEach(c => {
            const cat = c.querySelector('.card').dataset.category;
            c.style.display = (f === 'all' || cat === f) ? '' : 'none';
        });
        updateCount();
    });
});

document.querySelectorAll('.product-cat').forEach(a => {
    a.addEventListener('click', ev => {
        ev.preventDefault();
        const cat = a.dataset.cat.replaceAll("[ –]", "");
        const btn = [...filterBtns].find(b => b.dataset.filter === cat);
        if (btn)
            btn.click();
    });
});

document.getElementById('searchInput').addEventListener('input', e => {
    const q = e.target.value.trim().toLowerCase();
    cards.forEach(c => {
        const title = c.querySelector('.card').dataset.title.toLowerCase();
        c.style.display = (!q || title.includes(q)) ? '' : 'none';
    });
    updateCount();
});

updateCount();


let hoverTimer; // lưu timeout

document.querySelectorAll('.product-card').forEach(card => {
    card.addEventListener('mouseenter', () => {
        // bắt đầu đếm 2 giây khi hover
        hoverTimer = setTimeout(() => {
            const overlay = document.getElementById('productOverlay');
            document.getElementById('overlay-img').src = card.dataset.img;
            document.getElementById('overlay-title').textContent = card.dataset.name;
           document.getElementById('overlay-meta').innerHTML =
    `Difficulty: ${card.dataset.difficulty} · Pages: ${card.dataset.pages} · Category: ${card.dataset.category}<br>
     <span style="color:#ffca28; font-weight:bold;">Price: ${card.dataset.price}.000 VND</span>`;

               
            document.getElementById('overlay-desc').textContent = card.dataset.desc;


            overlay.style.display = 'flex';
        }, 2000); // 2 giây
    });

    card.addEventListener('mouseleave', () => {
        // nếu rời chuột trước 3 giây thì hủy mở overlay
        clearTimeout(hoverTimer);
    });
});


// Đóng popup
document.querySelector('.close-btn').addEventListener('click', () => {
    document.getElementById('productOverlay').style.display = 'none';
});

// Nếu click ngoài overlay thì đóng
document.getElementById('productOverlay').addEventListener('click', (e) => {
    if (e.target.id === 'productOverlay') {
        e.target.style.display = 'none';
    }
});


document.addEventListener("DOMContentLoaded", () => {
    const minSlider = document.getElementById("minPriceRange");
    const maxSlider = document.getElementById("maxPriceRange");
    const minPriceSpan = document.getElementById("minPrice");
    const maxPriceSpan = document.getElementById("maxPrice");
    const applyBtn = document.getElementById("applyPriceFilter");
    const typeFigure = parseInt(document.getElementById("typeFigure").dataset.value);
 

    function updateDisplay(event) {
        let minVal = parseInt(minSlider.value);
        let maxVal = parseInt(maxSlider.value);

        if (minVal >= maxVal) {
            if (event && event.target === minSlider) {
                minVal = maxVal - 50;
                minSlider.value = minVal;
            } else {
                maxVal = minVal + 50;
                maxSlider.value = maxVal;
            }
        }

        minPriceSpan.textContent = minVal;
        maxPriceSpan.textContent = maxVal;
    }

    minSlider.addEventListener("input", updateDisplay);
    maxSlider.addEventListener("input", updateDisplay);

    applyBtn.addEventListener("click", () => {
        const min = parseInt(minSlider.value);
        const max = parseInt(maxSlider.value);

        if(typeFigure === 0){
            window.location.href = `filterbyprice?min=${min}&max=${max}`;
        } else if(typeFigure === 1){
            window.location.href = `filterbypricenhua?min=${min}&max=${max}`;
        }
    });

    updateDisplay({target: minSlider}); // chạy lần đầu để hiển thị đúng
});

// --- Các chức năng khác ---
document.addEventListener("DOMContentLoaded", function () {
    const productCards = document.querySelectorAll(".product-card");
    const filterButtons = document.querySelectorAll(".filter-btn");

    // --- Lọc theo danh mục ---
    filterButtons.forEach(button => {
        button.addEventListener("click", function () {
            filterButtons.forEach(btn => btn.classList.remove("active"));
            this.classList.add("active");

            const filterValue = this.getAttribute("data-filter");

            productCards.forEach(card => {
                const cardCategory = card.getAttribute("data-category");
                if (filterValue === "all" || cardCategory === filterValue) {
                    card.parentElement.style.display = "block";
                } else {
                    card.parentElement.style.display = "none";
                }
            });
        });
    });

    // --- Nút yêu thích ---
    document.body.addEventListener('click', function(event) {
        if (event.target.closest('.fav-toggle')) {
            const favButton = event.target.closest('.fav-toggle');
            favButton.classList.toggle('active');
            const productId = favButton.dataset.id;
            console.log("Đã yêu thích/bỏ yêu thích sản phẩm:", productId);
        }
    });

    // --- Hiệu ứng load mượt ---
    document.body.classList.add("show");
});






    