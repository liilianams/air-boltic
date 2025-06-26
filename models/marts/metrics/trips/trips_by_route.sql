select
  route,
  count(distinct trip_id) as trips_count
from {{ ref('fct_orders') }}
where status = 'finished'
group by all