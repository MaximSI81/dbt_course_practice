{% set current_date = run_started_at|string() %}
{% set current_date = current_date|truncate(10, True, "") %}
select 
     count(*) as number_of_flights
from  
    {{ ref('fct_flight_schedule') }}

where scheduled_departure::date::text between '{{ current_date|replace("2025", "2015") }}' and '{{ current_date }}'

 