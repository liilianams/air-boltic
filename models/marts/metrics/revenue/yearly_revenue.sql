select
  year(revenue_recognition_date_utc) as revenue_recognition_year_utc,
  sum(revenue_eur) as revenue_eur
from {{ ref('fct_orders') }}
where status = 'finished'
group by revenue_recognition_year_utc
order by revenue_recognition_year_utc