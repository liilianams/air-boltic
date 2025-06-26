select
  airplanes.size_category as airplane_size_category,
  count(distinct orders.trip_id) as trips_count
from {{ ref('fct_orders') }} orders
left join {{ ref('dim_airplanes') }} airplanes on orders.airplane_id = airplanes.airplane_id
where status = 'finished'
group by all