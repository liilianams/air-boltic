select
  orders.trip_id,
  trips.airplane_id,
  airplane_models.max_seats,
  count(*) as seats_sold,
  ROUND((count(*) / airplane_models.max_seats) * 100, 2) AS percent_seats_occupied
from {{ ref('stg_orders') }} orders
left join {{ ref('stg_trips') }} trips on orders.trip_id = trips.trip_id
left join {{ ref('stg_airplanes') }} airplanes on trips.airplane_id = airplanes.airplane_id
join {{ ref('stg_airplane_models') }} airplane_models
  on airplanes.model = airplane_models.model and airplanes.manufacturer = airplane_models.manufacturer
where orders.status = 'finished'
group by all
