select
  order_category as order_price_category,
  count(order_id) as orders_count
from {{ ref('fct_orders') }}
where status = 'finished'
group by all