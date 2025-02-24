{{
  config(
    materialized = 'table',
    )
}}

select
from
    {{ ref('passenger_id_employee') }}