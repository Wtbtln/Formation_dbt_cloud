select 
    id as customer_id,
    last_name,
    first_name
from {{source('jaffle_shop','customers')}}