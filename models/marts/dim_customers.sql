select
  customers.customer_id,
  customers.name,
  customers.email,
  customers.phone_number,
  customer_groups.name as group_name,
  customer_groups.type as group_type,
  customer_groups.registry_number as group_registry_number
from {{ ref('stg_customers') }} customers
join {{ ref('stg_customer_groups') }} customer_groups
  on customers.customer_group_id = customer_groups.customer_group_id