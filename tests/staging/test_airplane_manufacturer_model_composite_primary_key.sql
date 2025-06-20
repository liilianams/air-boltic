select
  manufacturer,
  model,
  count(*) as record_count
from {{ ref('stg_airplane_models') }}
group by manufacturer, model
having count(*) > 1