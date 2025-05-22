{{

      config(
        materialized = 'table'
        )

}}
select 
  ticket_no, flight_id, fare_conditions, amount
from 
  {{ source('demo_src', 'ticket_flights') }}
{% if target.name == "dev" -%}
limit 100000
{%- endif %}


{# '-' тире в шаблоне jinja убирает преблы в скомпеллированном коде #}