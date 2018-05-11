{{ 'stylesheet' | jhtml: 'css/style.css' }}

<div id="jk-wishlist-module">
	{% if products %}
	<ul class="list-unstyled row">
		{% for product in products %}
		<li itemscope itemtype="http://schema.org/Product" class="col-3">
			<div class="card">
				<div style="height: 150px">
					{% if product.image %}
					<div class="product-image text-center">
						<a itemprop="url" href="{{ product.url }}" title="{{ product.name }}">
							<img itemprop="image" src="{{ product.image }}" alt="{{ product.alias }}" style="max-height: 75px; max-width: 75px" />
						</a>
					</div>
					{% endif %}
					<div class="card-body p-2">
						<div style="overflow: hidden; text-overflow: ellipsis; white-space: nowrap">
							<a itemprop="url" href="{{ product.url }}" title="{{ product.name }}">
								{{ product.name }}
							</a>
						</div>
						{% if product.introtext %}
						<div class="mt-1" style="font-size: 11px; line-height: 14px">
							<span itemprop="description">
								{{ product.introtext | truncateDesc: 35 }}
							</span>
						</div>
						{% endif %}
						{% if product.old_cost %}
						<del class="text-muted">{{ product.old_cost | costDisplay }}{{ currency.symbol }}</del>
						{% endif %}
					</div>
				</div>
				<div class="card-body p-2">
					{% if product.cost %}
					<div class="mt-1" itemprop="offers" itemscope itemtype="http://schema.org/Offer">
						<span class="cost">
							<meta itemprop="priceCurrency" content="{{ currency.code }}">
							{% assign options = 'dec_point,thousands_sep' | arrayCombine: '.', '*' %}
							<span itemprop="price" content="{{ product.cost | costDisplay: options }}">{{ product.cost | costDisplay }}</span>{{ currency.symbol }}
						</span>
					</div>
					{% endif %}
					<!--Buttons-->
					<div class="text-center mt-1">
						<!--remove product-->
						<a href="javascript:;" class="btn btn-sm btn-danger" data-click="remove-wishlist" data-index="{{ product.index }}" title="{{ '_' | jtext: 'MOD_JKASSA_WISHLIST_REMOVE' }}">
							<span class="fas fa-times"></span> {{ '_' | jtext: 'JACTION_DELETE' }}
						</a>
					</div>
				</div>
			</div>
		</li>
		{% endfor %}
	</ul>
	{% else %}
	{% if text_empty %}
	<!--Text empty wishlist-->
	<div class="alert alert-info mt-2">
		{{ text_empty }}
	</div>
	{% endif %}
	{% endif %}
</div>