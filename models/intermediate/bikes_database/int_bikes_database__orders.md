{% docs int_bikes_database__orders %}

This model provides an aggregated view of orders, combining data from multiple sources such as int_[...]_order_products, staffs and stores.
It enriches the data with the following metrics:
- __Total Quantity__: the total quantity of products by order,
- __Total Amount__: the total amount by order,
- __Total Discounted Amount__: the total amount by order, with the discount applied to each product.

{% enddocs %}
