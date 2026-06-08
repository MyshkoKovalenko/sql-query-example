WITH countries_sold AS (
    SELECT
        c.country_id,
        c.country_name,
        COUNT(DISTINCT d.deal_id) as num_sold
    FROM countries c
    LEFT JOIN manufacturers m ON m.country_id = c.country_id
    LEFT JOIN cars cr ON cr.manufacturer_id = m.manufacturer_id
    LEFT JOIN deals d ON cr.car_id = d.car_id
    GROUP BY c.country_id
    ORDER BY num_sold DESC
),
countries_bought AS (
    SELECT
        c.country_id,
        c.country_name,
        COUNT(DISTINCT d.deal_id) as num_bought
    FROM countries c
    LEFT JOIN clients on c.country_id = clients.country_id
    LEFT JOIN deals d ON d.client_id = clients.client_id
    GROUP BY c.country_id
    ORDER BY num_bought DESC
),
countries_total AS (
    SELECT
        cs.country_id,
        cs.country_name,
        cs.num_sold as total_transactions
    FROM countries_sold cs
    WHERE cs.num_sold > 0
    UNION ALL
    SELECT
        cb.country_id,
        cb.country_name,
        cb.num_bought
    FROM countries_bought cb
    WHERE cb.num_bought > 0
)

SELECT
    ct.country_name,
    cs.num_sold,
    SUM(ct.total_transactions) AS total,
    ROUND(cs.num_sold / SUM(ct.total_transactions), 2) AS sold_to_total_ratio
FROM countries_total ct
JOIN countries_sold cs ON cs.country_id = ct.country_id
GROUP BY ct.country_id, ct.country_name, cs.num_sold
ORDER BY sold_to_total_ratio DESC