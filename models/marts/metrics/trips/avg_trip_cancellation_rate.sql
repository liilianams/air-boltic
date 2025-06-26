with trips as (
  select
    trip_id,
    count(*) as total_orders,
    sum(case when status = 'cancelled' then 1 else 0 end) as cancelled_orders
  from {{ ref('fct_orders') }}
  group by trip_id
),

trip_cancellations as (
  select
    trip_id,
    round((cancelled_orders / total_orders) * 100, 2) as percent_cancelled
  from trips
)

select
  round(avg(percent_cancelled), 2) as avg_trip_cancellation_rate
from trip_cancellations
