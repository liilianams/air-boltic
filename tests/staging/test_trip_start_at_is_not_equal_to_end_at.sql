select *
from {{ ref('stg_trips') }}
where start_at_utc = end_at_utc