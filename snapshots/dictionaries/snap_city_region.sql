{% snapshot snap_city_region %}

{{
   config(
       target_schema='snapshot',
       unique_key='city',

       strategy='timestamp',
       updated_at='updated_at',
       hard_deletes='new_record',
       snapshot_meta_column_names={
           "dbt_is_deleted": "dbt_is_deleted",
      }
   )
}}
select
    city,
    region,
    updated_at
from
{{ ref('city_region') }}

{% endsnapshot %}