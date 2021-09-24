{% extends "base.html" %}

{% block page_content %}

        {% for order in orders %}
          <div class="mw6 center pa3 sans-serif">

            <h1 class="mb4">Order: {{ order.uuid | linebreaks }}</h1>
            <h2 class="mb4">Created at: {{ order.created_at | linebreaks }}</h2>
            <h2 class="mb4">Updated at: {{ order.updated_at | linebreaks }}</h2>
            <h2 class="mb4">Product UUID: {{ order.product | linebreaks }}</h2>
        {% endfor %}
          </div>

{% endblock %}
