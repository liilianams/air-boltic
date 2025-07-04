with trips as (
  select
    Trip_ID as trip_id,
    Origin_City as origin_city,
    Destination_City as destination_city,
    Airplane_ID as airplane_id,
    Start_Timestamp::timestamp as start_at_utc,
    End_Timestamp::timestamp as end_at_utc
  from {{ source('raw', 'trips') }}
),

duration as (
  select
    trip_id,
    abs(datediff(HOUR, start_at_utc, end_at_utc)) as duration_hours
  from trips
)

select
  trips.*,
  duration.duration_hours,
  case
    when duration.duration_hours <= 3 then 'short'
    when duration.duration_hours <= 7 then 'medium'
    else 'long'
  end as duration_category,
  case
    when trips.origin_city < trips.destination_city then trips.origin_city || ' - ' || trips.destination_city
    else trips.destination_city || ' - ' || trips.origin_city
  end as route
from trips
join duration on trips.trip_id = duration.trip_id







