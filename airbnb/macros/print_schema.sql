{% macro print_schema() %}
  {{ print("The target schema is: " ~ target.schema) }}
{% endmacro %}