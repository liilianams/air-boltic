select
  Customer_ID as customer_id,
  Name as name,
  Customer_Group_ID as customer_group_id,
  Email as email,
  Phone_Number as phone_number
from {{ source('raw', 'customers') }}