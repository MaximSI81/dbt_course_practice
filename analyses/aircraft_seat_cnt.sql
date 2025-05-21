select 
    aircraft_code,
    count(*) as count_seats_aircraft
from 
    {{ ref('stg_flight__aircrafts') }}
join {{ ref('stg_flight__seats') }} using(aircraft_code)
group by aircraft_code