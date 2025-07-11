{% macro calculate_total_discounted_amount(quantity_col, price_col, discount_col) %}
    ({{ quantity_col }} * ( {{ price_col }} * (1 - {{ discount_col }} )))
{% endmacro %}
