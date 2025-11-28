{% macro jodo(col1, col2) %}
    {{ col1 }} || ' ' || {{ col2 }}
{% endmacro %}


{% macro show_emps() %}
   do run_query('select employee_name from {{ ref('stg_employees') }}')
{% endmacro %}

{% macro unload() %}
{% do run_query("create or replace stage stage_analytics") %}
{% do run_query("copy into @stage_analytics from stg_nations partition by (region_id) 
file_format=(type=csv compression = none null_if=(' ')) header=true; ") %}
{% endmacro %}


{% macro run_metadata() %}
{
    "invocation_id": "{{ invocation_id }}",
    "run_started_at": "{{ run_started_at }}"
}
{% endmacro %}

{% macro dbt_meta() -%}
  '{{invocation_id}}'::varchar as dbt_batch_id,
  '{{run_started_at}}'::timestamp as dbt_batch_ts
{% endmacro %}









