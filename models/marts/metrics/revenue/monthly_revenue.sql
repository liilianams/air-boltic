select
  date_format(date_trunc('month', revenue_recognition_date_utc), 'yyyy-MM') as revenue_recognition_month_utc,
  sum(revenue_eur) as revenue_eur
from {{ ref('fct_orders') }}
where status = 'finished'
group by revenue_recognition_month_utc
order by revenue_recognition_month_utc