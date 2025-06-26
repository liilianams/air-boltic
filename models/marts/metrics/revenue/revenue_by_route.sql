select
  route as route,
  sum(revenue_eur) as revenue_eur
from {{ ref('fct_orders') }}
where status = 'finished'
group by all