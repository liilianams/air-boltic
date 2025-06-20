select
  lower(manufacturer) as manufacturer,
  upper(model) as model,
  max_seats::integer,
  max_weight::integer,
  max_distance::integer,
  engine_type
from {{ source('raw', 'aeroplane_models') }}