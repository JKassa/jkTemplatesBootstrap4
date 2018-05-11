{% comment %}
	Connect CSS and JavaScript to the header of the document.
{% endcomment %}
{{ 'stylesheet' | jhtml: 'css/style.css' }}
{{ 'loadAll5' | fontawesome }}

<!--Header-->
{% if heading %}
<h1>{{ heading }}</h1>
{% else %}
<h2>{{ title }}</h2>
{% endif %}

{% if pretext %}
<!--Pretext-->
<div>
	{{ pretext }}
</div>
{% endif %}

<!--Print-->
{% if print_screen == 0 %}
<div class="btn-group" role="group" style="position: absolute; right: 0">
	<a id="btnPrint" class="btn btn-secondary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" href="#">
		<span class="fas fa-cog"></span>
		<span class="caret"></span>
	</a>
	<ul class="dropdown-menu" aria-labelledby="btnPrint">
		<li class="dropdown-item">{{ print_icon }}</li>
	</ul>
</div>
{% else %}
<div class="btn btn-secondary no-print" style="position: fixed; right: 10px; top: 10px">
	{{ print_screen }}
</div>
{% endif %}

<div class="text-center">
	{% if print_screen == 0 %}
	<img src="{{ image }}" alt="action" />
	{% endif %}

	<h1>{{ order_status }}</h1>
	<p>{{ description }}</p>

	{% if print_screen == 0 and action == 'pending' %}
	<a href="{{ update_url }}" class="button btn btn-lg btn-warning">
		{{ '_' | jtext: 'COM_JKASSA_UPDATE_STATUS' }}
	</a>
	{% endif %}

	<hr />

	<h3>
		{{ 'sprintf' | jtext: 'COM_JKASSA_RESULT_NUMBER', pm_number }}
	</h3>
</div>

{% if note %}
<div class="alert alert-warning">
	{{ note }}
</div>
{% endif %}

{% if print_screen == 0 %}
<!--Order-->
{% assign options = 'active' | arrayCombine: 'data_products' %}
{{ 'startAccordion' | bootstrap4: 'resultAccordian', options }}
	<!--Information about order-->
	{% assign title = '_' | jtext: 'COM_JKASSA_YOUR_PURCHASES' %}
	{{ 'addSlide' | bootstrap4: 'resultAccordian', title, 'data_products' }}
		{% include 'views/result/products' %}
	{{ 'endSlide' | bootstrap4 }}
	<!--Order data-->
	{% assign title = '_' | jtext: 'COM_JKASSA_ORDER_DATA' %}
	{{ 'addSlide' | bootstrap4: 'resultAccordian', title, 'data_payment' }}
		{% include 'views/result/payment' %}
	{{ 'endSlide' | bootstrap4 }}
	<!--Data buyer-->
	{% assign title = '_' | jtext: 'COM_JKASSA_DATA_BUYER' %}
	{{ 'addSlide' | bootstrap4: 'resultAccordian', title, 'data_buyer' }}
		{% include 'views/result/buyer' %}
	{{ 'endSlide' | bootstrap4 }}
	{% if delivery %}
	<!--Data delivery-->
	{% assign title = '_' | jtext: 'COM_JKASSA_DATA_DELIVERY' %}
	{{ 'addSlide' | bootstrap4: 'resultAccordian', title, 'data_delivery' }}
		{% include 'views/result/delivery' %}
	{{ 'endSlide' | bootstrap4 }}
	{% endif %}
{{ 'endAccordion' | bootstrap4 }}

<!--Continue shopping-->
<p class="text-center mt-4">
	<a class="btn btn-secondary btn-lg" href="{{ home_page }}">
		{{ '_' | jtext: 'COM_JKASSA_CART_CONTINUE_SHOPPING' }}
	</a>
</p>
{% else %}
<!--Print-->
<h4>{{ '_' | jtext: 'COM_JKASSA_YOUR_PURCHASES' }}</h4>
{% include 'views/result/products' %}
<h4>{{ '_' | jtext: 'COM_JKASSA_ORDER_DATA' }}</h4>
{% include 'views/result/payment' %}
<h4>{{ '_' | jtext: 'COM_JKASSA_DATA_BUYER' }}</h4>
{% include 'views/result/buyer' %}
{% if delivery %}
<h4>{{ '_' | jtext: 'COM_JKASSA_DATA_DELIVERY' }}</h4>
{% include 'views/result/delivery' %}
{% endif %}
{% endif %}

{% if posttext %}
<!--Posttext-->
<div class="mt-1">
	{{ posttext }}
</div>
{% endif %}