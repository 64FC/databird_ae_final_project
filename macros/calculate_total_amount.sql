{% macro calculate_total_amount(quantity_col, price_col) %}
    ({{ quantity_col }} * {{ price_col }})
{% endmacro %}
