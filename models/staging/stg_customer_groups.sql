select
  ID as customer_group_id,
  Name as name,
  case when Type = 'Unknown group' then 'individual' else lower(Type) end as type,
  Registry_number as registry_number
from {{ source('raw', 'customer_groups') }}