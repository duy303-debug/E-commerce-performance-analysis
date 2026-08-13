--PRODUCT
--Doanh thu và lợi nhuận từng sản phẩm
--sản phẩm nào có doanh thu cao nhất và lợi nhuận cao nhất
SELECT product_name, SUM(price_usd) AS doanh_thu, SUM(price_usd)-SUM(cogs_usd) AS loi_nhuan
FROM order_items as ordi
JOIN products pr ON pr.product_id=ordi.product_id
GROUP BY product_name
ORDER BY doanh_thu DESC, loi_nhuan DESC
--Số sản phẩm bán được từng sản phẩm
-- sản phẩm nào bán chạy nhất
SELECT product_name, COUNT(ordi.product_id) AS so_luong
FROM order_items as ordi
JOIN products pr ON pr.product_id=ordi.product_id
GROUP BY product_name
ORDER BY so_luong DESC
--doanh thu theo thời gian 
SELECT
    FORMAT(created_at, 'yyyy-MM') AS thang,
    SUM(price_usd) AS doanh_thu
FROM order_items
GROUP BY FORMAT(created_at, 'yyyy-MM')
ORDER BY thang;
--phân bố sản phẩm trong đơn hàng
SELECT product_name, SUM(CASE WHEN is_primary_item=1 then 1 ELSE 0 END) AS san_pham_chinh,SUM(CASE WHEN is_primary_item=0 then 1 ELSE 0 END) AS san_pham_kem_theo
FROM order_items as ordi
JOIN products pr ON pr.product_id=ordi.product_id
GROUP BY product_name
--tỷ lệ hoàn trả từng sản phẩm
;WITH sales AS (
    SELECT
        pr.product_id,
        pr.product_name,
        COUNT(*) AS so_item_ban
    FROM order_items AS odi
    JOIN products AS pr
        ON pr.product_id = odi.product_id
    GROUP BY 
        pr.product_id,
        pr.product_name
),
refunds AS (
    SELECT
        odi.product_id,
        COUNT(DISTINCT odir.order_item_id) AS so_item_hoan_tra
    FROM order_item_refunds AS odir
    JOIN order_items AS odi
        ON odi.order_item_id = odir.order_item_id
    GROUP BY odi.product_id
)
SELECT
    s.product_name,
    s.so_item_ban,
    COALESCE(r.so_item_hoan_tra, 0) AS so_item_hoan_tra,
    COALESCE(r.so_item_hoan_tra, 0) * 100.0
        / s.so_item_ban AS ty_le_hoan_tra
FROM sales AS s
LEFT JOIN refunds AS r
    ON s.product_id = r.product_id
ORDER BY ty_le_hoan_tra DESC;