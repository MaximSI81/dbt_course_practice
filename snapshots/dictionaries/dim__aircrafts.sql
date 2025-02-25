{% snapshot dim__aircrafts %}

{{
   config(
       target_schema='snapshot',
       unique_key='aircraft_code',
       hard_deletes='new_record',

       strategy='check',
       check_cols = ['model', '"range"'],
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
    model, 
    "range"
from
{{ ref('stg_flight__aircrafts') }}


{% endsnapshot %}