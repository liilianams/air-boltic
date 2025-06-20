select
  airplanes.airplane_id,
  airplanes.model,
  airplanes.manufacturer,
  airplane_models.max_seats,
  airplane_models.max_weight,
  airplane_models.max_distance,
  airplane_models.engine_type
from {{ ref('stg_airplanes') }} airplanes
join {{ ref('stg_airplane_models') }} airplane_models
  on airplanes.model = airplane_models.model and airplanes.manufacturer = airplane_models.manufacturer
