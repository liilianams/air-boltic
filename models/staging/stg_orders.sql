with orders as (
  select
    Order_ID as order_id,
    Customer_ID as customer_id,
    Trip_ID as trip_id,
    Price_EUR::float as price,
    'EUR' as currency,
    Seat_No as seat_number,
    regexp_extract(seat_number, '(\\d+)')::integer AS seat_number_without_letter,
    lower(Status) as status
  from {{ source('raw', 'orders') }}
)

select
  *,
  case
    when seat_number_without_letter <= 3 then 'first'
    when seat_number_without_letter <= 6 then 'business'
    else 'economy'
  end as order_category
from orders