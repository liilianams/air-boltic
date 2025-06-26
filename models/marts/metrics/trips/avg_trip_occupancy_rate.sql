with occupancy as (
  select
    orders.trip_id,
    airplanes.max_seats,
    count(order_id) as seats_sold,
    round((count(order_id) * 1.0 / airplanes.max_seats) * 100, 2) as percent_seats_occupied
  from {{ ref('fct_orders') }} orders
  left join {{ ref('dim_airplanes') }} airplanes on orders.airplane_id = airplanes.airplane_id
  where orders.status = 'finished'
  group by orders.trip_id, airplanes.max_seats
)

select
  round(avg(percent_seats_occupied), 2) as avg_trip_occupancy_rate
from occupancy
