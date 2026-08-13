--Traffic&CVR
--so session theo và tỉ trọng thiet bi
WITH traffic_device AS (SELECT device_type, COUNT(website_session_id) AS so_luong_truy_cap
FROM website_sessions
GROUP BY device_type
)
SELECT *, so_luong_truy_cap*100.0/SUM(so_luong_truy_cap) OVER() AS ti_trong
FROM traffic_device
--Số lượng truy cập theo kênh
SELECT
    utm_source,
    COUNT(*) AS so_session
FROM website_sessions
GROUP BY utm_source
ORDER BY so_session DESC;
--số lượng truy cập theo chiến dịch
SELECT
    utm_campaign,
    COUNT(DISTINCT website_session_id) AS so_session
FROM website_sessions
GROUP BY utm_campaign
ORDER BY so_session DESC;
--Tỷ lệ chuyển đổi từng kênh theo chiến dịch
SELECT
    ws.utm_source,
    ws.utm_campaign,
    COUNT(DISTINCT ws.website_session_id) AS so_session,
    COUNT(DISTINCT o.order_id) AS so_order,
    COUNT(DISTINCT o.order_id) * 100.0
        / COUNT(DISTINCT ws.website_session_id) AS cvr
FROM website_sessions ws
LEFT JOIN orders o
    ON ws.website_session_id = o.website_session_id
GROUP BY
    ws.utm_source,
    ws.utm_campaign
ORDER BY cvr DESC;
--phễu chuyển đổi qua từng page cÓ landing
--phễu chuyển đổi qua từng page cÓ landing
;WITH first_page AS (
    SELECT
        website_session_id,
        pageview_url,
        ROW_NUMBER() OVER (
            PARTITION BY website_session_id
            ORDER BY created_at, website_pageview_id
        ) AS rn
    FROM website_pageviews
),
website_flag AS (
    SELECT
        fp.website_session_id,

        MAX(CASE WHEN wp.pageview_url IN (
            '/home', '/lander-1', '/lander-2', '/lander-3', '/lander-4', '/lander-5'
        ) THEN 1 ELSE 0 END) AS landing_page,

        MAX(CASE WHEN wp.pageview_url = '/products'
            THEN 1 ELSE 0 END) AS products_page,

        MAX(CASE WHEN wp.pageview_url IN (
            '/the-original-mr-fuzzy',
            '/the-forever-love-bear',
            '/the-hudson-river-mini-bear',
            '/the-birthday-sugar-panda'
        ) THEN 1 ELSE 0 END) AS product_detail_page,

        MAX(CASE WHEN wp.pageview_url = '/cart'
            THEN 1 ELSE 0 END) AS cart_page,

        MAX(CASE WHEN wp.pageview_url = '/shipping'
            THEN 1 ELSE 0 END) AS shipping_page,

        MAX(CASE WHEN wp.pageview_url IN ('/billing', '/billing-2')
            THEN 1 ELSE 0 END) AS billing_page,

        MAX(CASE WHEN wp.pageview_url = '/thank-you-for-your-order'
            THEN 1 ELSE 0 END) AS thankyou_page

    FROM first_page fp
    JOIN website_pageviews wp
        ON wp.website_session_id = fp.website_session_id
    WHERE fp.rn = 1
      AND fp.pageview_url IN (
          '/home', '/lander-1', '/lander-2', '/lander-3', '/lander-4', '/lander-5'
      )
    GROUP BY fp.website_session_id
)
SELECT
    SUM(landing_page) AS num_sessions_landing,
    SUM(products_page) AS num_sessions_product,
    SUM(product_detail_page) AS num_sessions_product_detail,
    SUM(cart_page) AS num_sessions_cart,
    SUM(shipping_page) AS num_sessions_shipping,
    SUM(billing_page) AS num_sessions_billing,
    SUM(thankyou_page) AS num_sessions_thankyou
FROM website_flag;

--phễu chuyển đổi qua từng page không landing
WITH first_page AS (
    SELECT
        website_session_id,
        pageview_url,
        ROW_NUMBER() OVER (
            PARTITION BY website_session_id
            ORDER BY created_at, website_pageview_id
        ) AS rn
    FROM website_pageviews
),

website_flag AS (
    SELECT
        fp.website_session_id,

        MAX(CASE WHEN wp.pageview_url = '/home'
            THEN 1 ELSE 0 END) AS home_page,

        MAX(CASE WHEN wp.pageview_url = '/products'
            THEN 1 ELSE 0 END) AS products_page,

        MAX(CASE WHEN wp.pageview_url IN (
            '/the-original-mr-fuzzy',
            '/the-forever-love-bear',
            '/the-hudson-river-mini-bear',
            '/the-birthday-sugar-panda'
        ) THEN 1 ELSE 0 END) AS product_detail_page,

        MAX(CASE WHEN wp.pageview_url = '/cart'
            THEN 1 ELSE 0 END) AS cart_page,

        MAX(CASE WHEN wp.pageview_url = '/shipping'
            THEN 1 ELSE 0 END) AS shipping_page,

        MAX(CASE WHEN wp.pageview_url IN ('/billing', '/billing-2')
            THEN 1 ELSE 0 END) AS billing_page,

        MAX(CASE WHEN wp.pageview_url = '/thank-you-for-your-order'
            THEN 1 ELSE 0 END) AS thankyou_page

    FROM first_page fp
    JOIN website_pageviews wp
        ON fp.website_session_id = wp.website_session_id

    WHERE fp.rn = 1
      AND fp.pageview_url = '/home'

    GROUP BY fp.website_session_id
)

SELECT
    SUM(home_page) AS home,
    SUM(products_page) AS products,
    SUM(product_detail_page) AS product_detail,
    SUM(cart_page) AS cart,
    SUM(shipping_page) AS shipping,
    SUM(billing_page) AS billing,
    SUM(thankyou_page) AS thankyou
FROM website_flag;