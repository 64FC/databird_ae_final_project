{% docs int_bikes_database__products %}

This model provides an aggregated view of products, combining data from multiple sources such as int_[...]_order_products, categories and brands.
It enriches the data with the following metrics:
- __Total Quantity__: the total quantity of products ordered,
- __Total Amount__: the total amount for the products ordered,
- __Total Discounted Amount__: the total amount for the products ordered, with the discount applied to each order,
- __Average Discount__: the average discount applied to the product.

{% enddocs %}
