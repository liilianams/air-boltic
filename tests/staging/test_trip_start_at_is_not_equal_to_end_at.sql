select *
from {{ ref('stg_trips') }}
where start_at = end_at