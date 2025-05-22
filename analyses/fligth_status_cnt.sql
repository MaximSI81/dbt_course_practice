{% set flight_status %}
select distinct
    status
from    
    {{ ref('stg_flight__flights') }}
{% endset %}

{% set query_status_flight_result = run_query(flight_status) %}
{% if execute %}
    {% set important_status = query_status_flight_result.columns[0].values() %}
{% else %}
    {% set important_status = [] %}
{% endif %}
select 
    {% for i in important_status %}
        sum(case when status = '{{ i }}' then 1 else 0 end) as status_{{ i.replace(' ', '_') }}
        {% if not loop.last %},{% endif %}
    {% endfor %}
from 
    {{ ref('stg_flight__flights') }}