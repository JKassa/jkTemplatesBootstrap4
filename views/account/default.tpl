{% comment %}
	Connect CSS and JavaScript to the header of the document.
{% endcomment %}
{{ 'stylesheet' | jhtml: 'css/style.css' }}
{{ 'script' | jhtml: 'js/template.js' }}
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

<!--Profile-->
{{ profile }}

<!--Nav-->
<ul class="list-group mb-4">
	{% if guest %}
	<li class="list-group-item">
		<a href="#" data-click="show-modal" data-id="jk-modal_login" data-src="{{ login_url }}">
			{{ '_' | jtext: 'JLOGIN' }}
		</a>
	</li>
	{% endif %}
	{% if allow_registration %}
	<li class="list-group-item">
		<a href="{{ registration_route }}">
			{{ '_' | jtext: 'JREGISTER' }}
		</a>
	</li>
	{% endif %}
	<li class="list-group-item">
		<a href="#" data-click="show-modal" data-id="jk-modal_cart" data-src="{{ cart_url }}">
			{{ '_' | jtext: 'COM_JKASSA_YOUR_CART' }}
			<span class="badge badge-secondary badge-pill float-right">{{ cart_quantity }}</span>
		</a>
	</li>
	<li class="list-group-item">
		<a href="#" data-click="show-modal" data-id="jk-modal_viewed" data-src="{{ viewed_url }}">
			{{ '_' | jtext: 'COM_JKASSA_VIEWED' }}
			<span class="badge badge-secondary badge-pill float-right">{{ viewed_quantity }}</span>
		</a>
	</li>
	<li class="list-group-item">
		<a href="#" data-click="show-modal" data-id="jk-modal_wishlist" data-src="{{ wishlist_url }}">
			{{ '_' | jtext: 'COM_JKASSA_YOUR_WISHLIST' }}
			<span class="badge badge-secondary badge-pill float-right">{{ wishlist_quantity }}</span>
		</a>
	</li>
	<li class="list-group-item">
		<a href="#" data-click="show-modal" data-id="jk-modal_compare" data-src="{{ compare_url }}">
			{{ '_' | jtext: 'COM_JKASSA_COMPARE_PRODUCTS' }}
			<span class="badge badge-secondary badge-pill float-right">{{ compare_quantity }}</span>
		</a>
	</li>
	{% if guest != 1 %}
	<li class="list-group-item">
		<a href="#" data-click="show-modal" data-id="jk-modal_orders" data-src="{{ orders_url }}">
			{{ '_' | jtext: 'COM_JKASSA_YOUR_ORDERS' }}
			<span class="badge badge-secondary badge-pill float-right">{{ orders_quantity }}</span>
		</a>
	</li>
	{% endif %}
	{% if affiliate %}
	<li class="list-group-item">
		<a href="{{ affiliate_route }}">
			{{ '_' | jtext: 'COM_JKASSA_AFFILIATE_PROGRAM' }}
		</a>
	</li>
	{% endif %}
</ul>

{% if posttext %}
<!--Posttext-->
<div>
	{{ posttext }}
</div>
{% endif %}

{% if guest %}
	{% comment %}
		Madal body for Login.
	{% endcomment %}
	{{ 'renderModal' | bootstrap4: 'jk-modal_login', 'modal-lg', 'COM_JKASSA_ACCOUNT_LOGIN', '', '', true }}
{% endif %}

{% comment %}
	Madal body for Cart.
{% endcomment %}
{% capture title_cart %}{{ '_' | jtext: 'COM_JKASSA_YOUR_CART' }} <span class="badge badge-secondary">{{ cart_quantity }}</span>{% endcapture %}
{{ 'renderModal' | bootstrap4: 'jk-modal_cart', 'modal-lg', title_cart, '', '', true }}

{% comment %}
	Madal body for Viewed.
{% endcomment %}
{% capture title_viewed %}{{ '_' | jtext: 'COM_JKASSA_VIEWED' }} <span class="badge badge-secondary">{{ viewed_quantity }}</span>{% endcapture %}
{{ 'renderModal' | bootstrap4: 'jk-modal_viewed', 'modal-lg', title_viewed, '', '', true }}

{% comment %}
	Madal body for Wishlist.
{% endcomment %}
{% capture title_wishlist %}{{ '_' | jtext: 'COM_JKASSA_YOUR_WISHLIST' }} <span class="badge badge-secondary">{{ wishlist_quantity }}</span>{% endcapture %}
{{ 'renderModal' | bootstrap4: 'jk-modal_wishlist', 'modal-lg', title_wishlist, '', '', true }}

{% comment %}
	Madal body for Compare.
{% endcomment %}
{% capture title_compare %}{{ '_' | jtext: 'COM_JKASSA_COMPARE_PRODUCTS' }} <span class="badge badge-secondary">{{ compare_quantity }}</span>{% endcapture %}
{{ 'renderModal' | bootstrap4: 'jk-modal_compare', 'modal-lg', title_compare, '', '', true }}

{% comment %}
	Madal body for Orders.
{% endcomment %}
{% capture title_orders %}{{ '_' | jtext: 'COM_JKASSA_YOUR_ORDERS' }} <span class="badge badge-secondary">{{ orders_quantity }}</span>{% endcapture %}
{{ 'renderModal' | bootstrap4: 'jk-modal_orders', 'modal-lg', title_orders, '', '', true }}