select
  date_trunc('week', activity_date_utc)::date as activity_week_utc,
  count(distinct customer_id) as daily_active_customers
from {{ ref('fct_customer_activity') }}
group by activity_week_utc
order by activity_week_utc