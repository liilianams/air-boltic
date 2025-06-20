with valid_orders as (
  select
    orders.customer_id,
    trips.end_at::date as order_date
  from {{ ref('stg_orders') }} orders
  join {{ ref('stg_trips') }} trips on orders.trip_id = trips.trip_id
  where orders.status = 'finished'
)

select
  customer_id,
  order_date as activity_date,
  count(distinct customer_id) as active_customers
from valid_orders
group by all
order by activity_date