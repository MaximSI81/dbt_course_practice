{% snapshot dim__aircraft_seats %}

{{
   config(
       target_schema='snapshot',
       unique_key=['aircraft_code', 'seat_no'],
       check_cols = ['seat_no', 'fare_conditions'],
       hard_deletes='new_record',
       strategy='check',
       dbt_valid_to_current = "'1999-01-01'::date",


        snapshot_meta_column_names={
            "dbt_valid_from": "dbt_effective_date_from",
            "dbt_valid_to": "dbt_effective_date_to",
            "dbt_is_deleted": "dbt_is_deleted",
        }

   )
}}
select
    aircraft_code, 
    seat_no, 
    fare_conditions
from
{{ ref('stg_flight__seats') }}

{% endsnapshot %}