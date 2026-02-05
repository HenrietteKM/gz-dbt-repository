
select
  date_date,
  orders_id,
  margin,
  shipping_fee,
  log_Cost,
  ship_cost,
  (margin + shipping_fee - log_Cost - ship_cost) as operational_margin

FROM {{ ref('int_orders_margin') }} as margin_table
LEFT JOIN {{ ref('stg_raw_ship') }} as ship_table
USING (orders_id)
GROUP BY
  date_date,
  orders_id,
  margin,
  shipping_fee,
  log_Cost,
  ship_cost