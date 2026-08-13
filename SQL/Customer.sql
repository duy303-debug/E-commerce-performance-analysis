--CUSTOMER
--Lượng người mua theo thời gian
SELECT FORMAT(created_at,'yyyy-MM') as thang, COUNT(distinct user_id) as soluongnguoimua
FROM orders
GROUP BY FORMAT(created_at,'yyyy-MM')
ORDER BY thang 
--lượng người xem theo thời gian 
SELECT FORMAT(created_at,'yyyy-MM') as thang, COUNT(distinct user_id) as soluongnguoixem
FROM website_sessions
GROUP BY FORMAT(created_at, 'yyyy-MM')
ORDER BY thang
--top5 khách hàng có đóng góp doanh thu cao nhất
SELECT TOP 5
    user_id,
    COUNT(DISTINCT order_id) AS so_don,
    SUM(price_usd) AS doanh_thu
FROM orders
GROUP BY user_id
ORDER BY doanh_thu DESC;
-----tỷ lệ chuyển đổi khách hàng mới và cũ
SELECT CASE WHEN is_repeat_session=1 THEN 'khach cu' ELSE 'khach moi' END AS loai_khach_hang,COUNT(od.order_id) as sodonhang,
COUNT(ws.website_session_id) soluongtruycap, COUNT( od.order_id) * 100.0/ COUNT( ws.website_session_id) AS cvr
FROM website_sessions ws
LEFT JOIN orders od ON od.website_session_id=ws.website_session_id
GROUP BY CASE WHEN is_repeat_session=1 THEN 'khach cu' ELSE 'khach moi' END
---AOV
SELECT
    CASE
        WHEN ws.is_repeat_session = 1 THEN 'Returning'
        ELSE 'New'
    END AS visitor_type,
    COUNT(DISTINCT o.order_id) AS so_order,
    SUM(o.price_usd) AS doanh_thu,
    SUM(o.price_usd) * 1.0
        / COUNT(DISTINCT o.order_id) AS AOV
FROM website_sessions ws
JOIN orders o
    ON ws.website_session_id = o.website_session_id
GROUP BY
    CASE
        WHEN ws.is_repeat_session = 1 THEN 'Returning'
        ELSE 'New'
    END
ORDER BY AOV DESC;