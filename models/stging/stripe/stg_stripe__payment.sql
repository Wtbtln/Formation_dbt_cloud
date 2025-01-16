select
 id as payment_id,
 orderid,
 amount
from {{ source('stripe', 'payment') }}