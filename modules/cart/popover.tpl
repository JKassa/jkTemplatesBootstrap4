{{ 'stylesheet' | jhtml: 'css/style.css' }}
{{ 'loadAll5' | fontawesome }}

{% comment %}
	HTML code for the popover window.
{% endcomment %}
{% capture popover_html %}
<div class="row">
	{% if image %}
	<!--Image-->
	<div class="col-3">
		<a href="{{ url_cart }}">
			<img alt="cart" src="{{ image }}" title="{{ image_title }}">
		</a>
	</div>
	{% endif %}
	<div class="{% if image %}col-9{% else %}col-12{% endif %}">
		{% if products %}
		<!--Quantity-->
		<p class="text-center">
			{% capture cart_quantity %}<strong>{{ quantity }}</strong>{% endcapture %}
			{{ 'sprintf' | jtext: 'MOD_JKASSA_CART_COUNT', cart_quantity }}
		</p>
		<!--List products-->
		<ul class="list-unstyled">
			{% for product in products %}
			<li>
				<a href="{{ product.url }}">
					{{ product.name }}
				</a>
				<!--remove product-->
				<a href="javascript:;" data-click="remove-product" data-index="{{ product.index }}" data-id="{{ product.id }}" title="{{ '_' | jtext: 'MOD_JKASSA_CART_REMOVE' }}">
					<span class="fas fa-times text-danger" style="font-size:10px"></span>
				</a>
				{% if product.variants %}
				<br>
				<small>
					{% for variant in product.variants %}
					{{ variant.name }}:
					{% case variant.type %}
					{% when 'radio' %}
					<span class="variant-radio-value">
						{{ variant.value }}
					</span>
					{% when 'color' %}
					<span class="minicolors-swatch">
						<span style="background-color: {{ variant.value }};" title="{{ variant.title }}"></span>
					</span>
					{% when 'texture' %}
					<span class="minicolors-swatch">
						<img src="{{ variant.img }}" alt="{{ variant.alt }}" title="{{ variant.title }}">
					</span>
					{% when 'select' %}
					<span>
						{{ variant.value }}
					</span>
					{% endcase %}
					{% endfor %}
				</small>
				{% endif %}
				<br>
				{% if product.old_cost %}
				<!--old cost-->
				<del>{{ product.old_cost | costDisplay }}{{ currency.symbol }}</del>
				{% endif %}
				<!--cost-->
				<strong>{{ product.cost | costDisplay }}{{ currency.symbol }}</strong>
				<small>({{ product.quantity }})</small>
			</li>
			{% endfor %}
		</ul>
		<!--Cart total-->
		<p class="text-center">
			{% capture cart_total %}<strong>{{ total | costDisplay }}{{ currency.symbol }}</strong>{% endcapture %}
			{{ 'sprintf' | jtext: 'MOD_JKASSA_CART_AMOUNT', cart_total }}
		</p>
		{% else %}
		<p class="text-muted">
			<em>
				{% if text_empty %}
				<!--Text empty-->
				{{ text_empty }}
				{% else %}
				<!--Quantity-->
				{% capture cart_quantity %}<strong>{{ quantity }}</strong>{% endcapture %}
				{{ 'sprintf' | jtext: 'MOD_JKASSA_CART_COUNT', cart_quantity }}
				{% endif %}
			</em>
		</p>
		{% endif %}
	</div>
</div>
{% if products %}
<!--URLs Go to order & Go to cart-->
<div class="card-footer text-center" style="margin: 0 -12px -8px;">
	<a class="btn btn-sm btn-primary" href="{{ url_order }}">
		<i class="fas fa-chevron-right"></i>
		{{ '_' | jtext: 'MOD_JKASSA_CART_ORDER' }}
	</a>
	<a class="btn btn-sm btn-secondary" href="{{ url_cart }}">
		<i class="fas fa-shopping-cart"></i>
		{{ '_' | jtext: 'MOD_JKASSA_CART_CART' }}
	</a>
</div>
{% endif %}
{% endcapture %}

<div id="jk-cart-module">
	<div class="jk-cart-popover">
		<a data-toggle="popover" href="javascript:;" class="btn btn-dark btn-sm">
			<span class="fas fa-shopping-cart"></span>
			{{ '_' | jtext: 'MOD_JKASSA_CART_CART' }}
			<span class="badge badge-light">{{ quantity }}</span>
		</a>
	</div>
	<div class="jk-cart-popover-content" style="display: none;">
		{{ popover_html }}
	</div>
	<script type="text/javascript">
		jQuery(document).ready(function () {
			"use strict";
			jQuery('.jk-cart-popover a').popover({
				html: true,
				placement: 'bottom',
				container: 'body',
				title: '{{ image_title }}',
				content: function () {
					return jQuery('.jk-cart-popover-content').html();
				}
			}).click(function (e) {
				e.preventDefault();
				jQuery(this).focus();
			});
			jQuery(document).mouseup(function (e) {
				var container = jQuery('.jk-cart-popover');

				if (container.has(e.target).length === 0) {
					jQuery('.jk-cart-popover a').popover('hide');
				}
			});
		});
	</script>
</div>