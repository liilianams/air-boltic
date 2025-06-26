select
  customers.group_type as customer_group_type,
  count(orders.order_id) as orders_count
from {{ ref('fct_orders') }} orders
left join {{ ref('dim_customers') }} customers on orders.customer_id = customers.customer_id
where orders.status = 'finished'
group by all