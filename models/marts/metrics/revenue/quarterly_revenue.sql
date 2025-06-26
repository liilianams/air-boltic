with quarterly_revenue as (
  select
    concat('Q', quarter(revenue_recognition_date_utc), ' ', year(revenue_recognition_date_utc)) as revenue_recognition_quarter_utc,
    revenue_eur
  from {{ ref('fct_orders') }}
  where status = 'finished'
)

select
  revenue_recognition_quarter_utc,
  sum(revenue_eur) as revenue_eur
from quarterly_revenue
group by revenue_recognition_quarter_utc
