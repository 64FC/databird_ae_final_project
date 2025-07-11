{% docs int_bikes_database__products %}

This model provides an aggregated view of products, combining data from multiple sources such as int_[...]_order_products, categories and brands.
It enriches the data with the following metrics:
- Total Quantity: the total quantity of products ordered,
- Total Amount: the total amount for the products ordered,
- Total Discounted Amount: the total amount for the products ordered, with the discount applied to each order,
- Avg Discount: the average discount applied to the product.

{% enddocs %}
