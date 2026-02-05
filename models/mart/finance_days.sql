
select
  operational_table.date_date as date,
  COUNT(DISTINCT orders_id) as total_nb_transactions,
  SUM(revenue) as total_revenue,
  AVG(quantity) as average_basket,
  operational_margin,
  SUM(purchase_cost) as total_purchase_cost,
  SUM(shipping_fee) as total_shipping_fee,
  SUM(log_Cost) as total_log_cost,
  SUM(quantity) as total_quantity
  

FROM {{ ref('int_orders_operational') }} as operational_table
LEFT JOIN {{ ref('int_orders_margin') }} as margin_table
USING (orders_id)
GROUP BY
  date,
  operational_margin