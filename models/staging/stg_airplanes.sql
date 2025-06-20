select
  Airplane_ID as airplane_id,
  upper(Airplane_Model) as model,
  lower(Manufacturer) as manufacturer
from {{ source('raw', 'aeroplanes') }}