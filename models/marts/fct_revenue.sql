with finished_trips as (
  select
    orders.order_id,
    orders.customer_id,
    trips.trip_id,
    airplanes.airplane_id,
    trips.end_at::date as revenue_recognition_date,
    (orders.price * 0.2) as revenue,
    orders.currency
  from {{ ref('stg_orders') }} as orders
  join {{ ref('stg_trips') }} as trips on orders.trip_id = trips.trip_id
  join {{ ref('stg_customers') }} as customers on orders.customer_id = customers.customer_id
  join {{ ref('stg_airplanes') }} as airplanes on trips.airplane_id = airplanes.airplane_id
  where orders.status = 'finished'
)

select
  order_id,
  customer_id,
  trip_id,
  airplane_id,
  revenue_recognition_date,
  revenue,
  currency
from finished_trips