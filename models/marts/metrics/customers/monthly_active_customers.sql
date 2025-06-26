select
  date_format(date_trunc('month', activity_date_utc), 'yyyy-MM') as activity_month_utc,
  count(distinct customer_id) as monthly_active_customers
from {{ ref('fct_customer_activity') }}
group by activity_month_utc
order by activity_month_utc