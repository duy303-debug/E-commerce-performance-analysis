# 📊 Phân Tích Hiệu Suất Kinh Doanh E-Commerce

## 📌 Tổng quan dự án

Dự án phân tích hiệu suất kinh doanh của một doanh nghiệp E-Commerce giả định – **Fuzzy Factory** – bằng **SQL và Power BI**.

Mục tiêu của dự án là phân tích hiệu quả hoạt động kinh doanh, hành vi khách hàng, hiệu suất marketing, quá trình chuyển đổi trên website và hiệu quả của từng sản phẩm.

### Câu hỏi kinh doanh chính:

> **Làm thế nào Fuzzy Factory có thể tăng doanh thu thông qua việc tối ưu Marketing, Website Conversion, Product Strategy và Customer Retention?**

---

# 🎯 Các câu hỏi phân tích

## 1. Traffic & Marketing Performance

- Kênh Marketing nào mang lại lượng Traffic lớn nhất?
- Kênh và Campaign nào có Conversion Rate tốt nhất?
- Doanh nghiệp có đang phụ thuộc quá nhiều vào một nguồn Traffic hay không?

## 2. Website Conversion

- Khách hàng rời bỏ ở đâu trong Conversion Funnel?
- Bước nào là điểm nghẽn lớn nhất trong hành trình mua hàng?
- Landing Page mới có giúp cải thiện Conversion Rate hay không?

## 3. Product Performance

- Sản phẩm nào đóng góp nhiều nhất vào doanh số?
- Các sản phẩm mới có đóng góp vào tăng trưởng kinh doanh không?
- Sản phẩm nào có tỷ lệ hoàn trả cao nhất?

## 4. Customer Analysis

- Khách hàng mới và khách hàng quay lại khác nhau như thế nào?
- Nhóm khách hàng nào có Conversion Rate và AOV tốt hơn?
- Doanh nghiệp có đang tận dụng tốt nhóm khách hàng quay lại hay không?

---

# 🗂️ Dataset

Dataset mô phỏng hoạt động của một doanh nghiệp E-Commerce có tên **Fuzzy Factory**.

Dữ liệu bao gồm các bảng liên quan đến:

- Website Sessions
- Website Pageviews
- Orders
- Order Items
- Products
- Order Item Refunds

Thời gian phân tích: **2012 – 2015**

---

# 🛠️ Công cụ sử dụng

- **SQL** – Truy vấn, phân tích và xử lý dữ liệu
- **Power BI** – Xây dựng Dashboard và trực quan hóa dữ liệu
- **DAX** – Xây dựng các KPI và chỉ số phân tích
- **GitHub** – Lưu trữ và trình bày dự án

---

# 📊 Dashboard

Dashboard được xây dựng trên Power BI và bao gồm 4 nhóm phân tích chính:

- **Executive Overview**
- <img width="1797" height="1008" alt="image" src="https://github.com/user-attachments/assets/050ca1d9-9065-47bb-93d7-0db2c59a3005" />

- **Traffic & Conversion**
- <img width="1798" height="1013" alt="image" src="https://github.com/user-attachments/assets/dfdaf5b3-9b3d-4ccf-890d-c65be2217bea" />
- **Product Performance**
- <img width="1799" height="1013" alt="image" src="https://github.com/user-attachments/assets/18501eea-037c-493a-94dd-3dd5209dc1a3" />
- **Customer Analysis**
-<img width="1797" height="1009" alt="image" src="https://github.com/user-attachments/assets/2276f1e9-43ee-446d-9c07-1af84eb60a4b" />

---

# 🔍 Key Insights

## 🚦 Traffic & Conversion

- **Google Search** là kênh mang lại lượng Traffic lớn nhất, vượt xa bSearch và Socialbook, cho thấy doanh nghiệp đang phụ thuộc đáng kể vào một nguồn thu hút khách hàng chính.

- **Cart** là điểm nghẽn lớn nhất trong Conversion Funnel, với tỷ lệ rời bỏ khoảng **54.8%**, cho thấy đây là khu vực cần được ưu tiên tối ưu.

- Sau khi áp dụng Landing Page mới, **Conversion Rate tăng từ 6.8% lên 7.1%**, cho thấy thay đổi này có tác động tích cực đến hiệu quả chuyển đổi.

- Các **Brand Campaign** mang lại Conversion Rate tốt nhất:
  - bSearch Brand: **8.66%**
  - gSearch Brand: **7.53%**

- Lượng Traffic chủ yếu đến từ **Desktop**.

---

## 📦 Product Performance

- **Mr. Fuzzy** chiếm **52,95% tổng doanh thu** và duy trì tăng trưởng ổn định qua các tháng. Tuy nhiên, tỷ trọng doanh thu quá lớn từ một sản phẩm tạo ra **rủi ro phụ thuộc**, nếu nhu cầu đối với Mr. Fuzzy suy giảm.

- **Mini Bear** có mức giá thấp nhất (**$29.99**), được định vị là **mua kèm**, trong khi 3 sản phẩm còn lại đóng vai trò là **sản phẩm chính** trong danh mục.

- **Birthday Sugar Panda** có tỷ lệ hoàn trả cao nhất (**6,04%**), cao gần **5 lần** so với Mini Bear (**1,28%**), cho thấy doanh nghiệp cần ưu tiên kiểm tra nguyên nhân hoàn trả của sản phẩm này.

---

## 👥 Customer Analysis

- Khách hàng quay lại có chất lượng tốt hơn với **Conversion Rate đạt 7.83%**, cao hơn khách hàng mới (**6.64%**).

- **AOV của hai nhóm gần như tương đương**, khoảng:
  - Khách hàng quay lại: **$61**
  - Khách hàng mới: **$60**

- Tuy nhiên, số đơn hàng vẫn chủ yếu đến từ khách hàng mới, trong khi nhóm khách hàng quay lại chiếm tỷ trọng tương đối nhỏ.

=> Điều này cho thấy doanh nghiệp có cơ hội cải thiện **Customer Retention** và tăng tỷ lệ mua lại.

---

# 💡 Recommendations

## 1. Tối ưu Cart để giảm tỷ lệ rời bỏ

Cart có tỷ lệ Drop-off cao nhất (**54.8%**).

Doanh nghiệp nên:

- Kiểm tra chi phí phát sinh và thông tin vận chuyển
- Đơn giản hóa quy trình Checkout
- Tăng tính minh bạch về giá
- Thử nghiệm ưu đãi hoặc miễn phí vận chuyển
- Bổ sung các yếu tố tạo niềm tin cho khách hàng

---

## 2. Giảm sự phụ thuộc vào Mr. Fuzzy

Mr. Fuzzy đóng góp hơn **52.95% doanh số**, tạo ra rủi ro tập trung doanh thu.

Doanh nghiệp nên:

- Tiếp tục duy trì Mr. Fuzzy như sản phẩm chủ lực
- Đẩy mạnh quảng bá các sản phẩm khác
- Thử nghiệm Bundle và Cross-selling
- Phát triển thêm các sản phẩm có khả năng trở thành nguồn doanh thu mới

---

## 3. Kiểm tra nguyên nhân hoàn trả của Birthday Sugar Panda

Với Refund Rate lên đến **6.04%**, doanh nghiệp nên phân tích thêm:

- Chất lượng sản phẩm
- Mô tả và hình ảnh sản phẩm
- Kỳ vọng của khách hàng
- Quá trình vận chuyển và đóng gói

---

## 4. Duy trì và mở rộng Brand Campaign

Các Brand Campaign có Conversion Rate cao nhất, đặc biệt là:

- **bSearch Brand: 8.66%**
- **gSearch Brand: 7.53%**

Doanh nghiệp nên tiếp tục duy trì và thử nghiệm mở rộng ngân sách cho các Campaign có hiệu quả cao, đồng thời tìm kiếm thêm nguồn Traffic để giảm sự phụ thuộc vào Google Search.

---

## 5. Tăng cường Customer Retention

Khách hàng quay lại có Conversion Rate cao hơn nhưng vẫn chiếm tỷ trọng nhỏ.

Doanh nghiệp có thể triển khai:

- Email Remarketing
- Loyalty Program
- Ưu đãi dành cho khách hàng cũ
- Product Recommendation
- Cross-selling sau khi mua hàng

---

# 📈 Các KPI chính

Các chỉ số được sử dụng trong dự án:

- Total Revenue
- Total Orders
- Gross Profit
- Conversion Rate
- Average Order Value (AOV)
- Website Traffic
- Refund Rate
- Revenue / Orders by Product
- Conversion Rate by Marketing Channel
- New vs. Repeat Customer Performance

---

# 📁 Cấu trúc Project

```text
E-commerce-performance-analysis/
│
├── README.md
├── docs
│   └── data_dictionary.pdf
├── SQL/
    ├── Customer.sql
    ├── Product.sql
    └── Traffic_conversion.sql
---

# 📊 Dashboard

👉 [Download Power BI Dashboard](https://drive.google.com/file/d/1arc01Kotti7f3MiyQYHAv6iMCSE1pTNl/view?usp=sharing)

