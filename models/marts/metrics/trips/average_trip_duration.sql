select
  route,
  avg(duration_hours) as avg_trip_duration_hours
from {{ ref('fct_orders') }}
where status = 'finished'
group by route
