# orders margin
select
  date_date,
  orders_id,
  revenue,
  quantity,
  (revenue - (quantity * purchase_price)) as margin,
  (quantity * purchase_price) as purchase_cost

FROM {{ ref('stg_raw_gz_sales') }} as sales_table
LEFT JOIN {{ ref('stg_raw_product') }} as product_table
USING (products_id)
GROUP BY
  date_date,
  orders_id,
  revenue,
  quantity,
  purchase_price