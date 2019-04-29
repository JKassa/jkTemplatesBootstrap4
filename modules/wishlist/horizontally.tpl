{{ 'stylesheet' | jhtml: 'css/style.css' }}

<div id="jk-wishlist-module" class="{{ class_sfx }}">
	{% if products %}
	<ul class="list-unstyled row">
		{% for product in products %}
		<li class="col-3">
			<div class="card">
				<div style="height: 150px">
					{% if product.image %}
					<div class="product-image text-center">
						<a href="{{ product.url }}" title="{{ product.name }}">
							<img src="{{ product.image }}" alt="{{ product.alias }}" style="max-height: 75px; max-width: 75px" />
						</a>
					</div>
					{% endif %}
					<div class="card-body p-2">
						<div style="overflow: hidden; text-overflow: ellipsis; white-space: nowrap">
							<a href="{{ product.url }}" title="{{ product.name }}">
								{{ product.name }}
							</a>
						</div>
						{% if product.introtext %}
						<div class="mt-1" style="font-size: 11px; line-height: 14px">
							{{ product.introtext | truncateDesc: 35 }}
						</div>
						{% endif %}
						{% if product.old_cost %}
						<del class="text-muted">{{ product.old_cost | costDisplay }}{{ currency.symbol }}</del>
						{% endif %}
					</div>
				</div>
				<div class="card-body p-2">
					{% if product.cost %}
					<div class="mt-1">
						<span class="cost">
							<span>{{ product.cost | costDisplay }}</span>{{ currency.symbol }}
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