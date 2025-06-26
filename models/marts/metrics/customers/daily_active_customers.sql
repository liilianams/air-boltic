select
  activity_date_utc,
  count(distinct customer_id) as daily_active_customers
from {{ ref('fct_customer_activity') }}
group by activity_date_utc
order by activity_date_utc