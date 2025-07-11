{% docs int_bikes_database__orders %}

This model provides an aggregated view of orders, combining data from multiple sources such as int_[...]_order_products, customers, staffs and stores.
It enriches the data with the following metrics:
- Total Quantity: the total quantity of products by order,
- Total Amount: the total amount by order,
- Total Discounted Amount: the total amount by order, with the discount applied to each product.

{% enddocs %}
