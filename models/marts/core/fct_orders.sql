with orders as (
  select
    orders.order_id,
    orders.customer_id,
    orders.trip_id,
    trips.airplane_id,
    orders.price,
    orders.currency,
    orders.seat_number,
    orders.status,
    orders.order_category,
    trips.origin_city,
    trips.destination_city,
    trips.start_at_utc,
    trips.end_at_utc,
    trips.duration_hours,
    trips.duration_category,
    trips.route
  from {{ ref('stg_orders') }} orders
  left join {{ ref('stg_trips') }} trips on orders.trip_id = trips.trip_id
)

select
  *,
  case
    when status = 'finished' then end_at_utc::date
    else null
  end as revenue_recognition_date_utc,
  case
    when status = 'finished' then (price * 0.2)
    else null
  end as revenue_eur
from orders