{{

      config(
        materialized = 'table'
        )

}}
select airport_code, airport_name, city, coordinates, timezone "range"
from {{ source('demo_src', 'airports') }}