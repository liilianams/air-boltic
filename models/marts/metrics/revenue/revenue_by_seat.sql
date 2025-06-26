with orders as (
  select
    orders.trip_id,
    orders.airplane_id,
    airplanes.max_seats,
    sum(orders.revenue_eur) as revenue_eur
  from {{ ref('fct_orders') }} orders
  left join {{ ref('dim_airplanes') }} airplanes on orders.airplane_id = airplanes.airplane_id
  where status = 'finished'
  group by all
)

select
  trip_id,
  airplane_id,
  max_seats,
  round(revenue_eur / max_seats, 2) as revenue_per_seat_eur
from orders
