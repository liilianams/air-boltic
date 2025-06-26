with finished_orders as (
  select
    orders.customer_id,
    trips.end_at_utc::date as order_date_utc
  from {{ ref('stg_orders') }} orders
  join {{ ref('stg_trips') }} trips on orders.trip_id = trips.trip_id
  where orders.status = 'finished'
)

select
  customer_id,
  order_date_utc as activity_date_utc
from finished_orders
group by all
order by activity_date_utc