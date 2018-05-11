{{ 'stylesheet' | jhtml: 'css/style.css' }}
{{ 'tooltip' | bootstrap4 }}

<div id="jk-wishlist-module">
	{% if image %}
	<!--Wishlist image-->
	<div class="text-center">
		<a href="{{ url_wishlist }}">
			<img alt="wishlist" src="{{ image }}" title="{{ image_title }}">
		</a>
	</div>
	{% endif %}
	{% if products %}
	<div class="row">
		<div class="col-12 mt-2">
			<div class="card p-0">
				<!--Products-->
				{% for product in products %}
				<div class="container-fluid jk-table-body p-0">
					<!--Product Image-->
					<div class="col-4">
						<div class="product-image">
							{% if product.discount %}
							<ul class="stickers">
								<li>
									<span class="product-label">-{{ product.discount }}</span>
								</li>
							</ul>
							{% endif %}
							<a href="{{ product.url }}" target="_blank">
								<img {{ product.image | img_exists: '88x127' }} alt="{{ product.alias }}" title="{{ product.name }}" />
							</a>
						</div>
					</div>
					<!--Product Information-->
					<div class="col-8">
						<!--Name-->
						<h5>
							<a href="{{ product.url }}" target="_blank">
								{{ product.name }}
							</a>
							{% if product.present %}
							<!--present-->
							+
							<a href="{{ product.present.url }}" target="_blank">
								{{ product.present.name }}
							</a>
							{% endif %}
							{% if product.files %}
							<!--files-->
							<small class="text-muted hasTooltip" title="<strong>{{ '_' | jtext: 'COM_JKASSA_ATTACHMENT' }}:</strong><br>{{ product.files | join: '<br>' }}">
								<span class="fas fa-download"></span>
							</small>
							{% endif %}
						</h5>

						{% if product.sku %}
						<!--SKU (code)-->
						<div class="text-muted small text-right mt-1">
							{{ '_' | jtext: 'MOD_JKASSA_WISHLIST_SKU' }}: {{ product.sku }}
						</div>
						{% endif %}

						{% if product.variants %}
						<!--Variants-->
						<div class="small mt-2">
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
									{% when 'select' %}
										<span>
											{{ variant.value }}
										</span>
								{% endcase %}
							{% endfor %}
						</div>
						{% endif %}

						<div class="mt-2">
							<!--Cost-->
							{{ product.cost | costDisplay }}{{ currency.symbol }}
							{% if product.old_cost %}
								<!--Old cost-->
								<del class="text-muted">{{ product.old_cost | costDisplay }}{{ currency.symbol }}</del>
							{% endif %}
						</div>
					</div>
					<!--Buttons-->
					<div class="col-12 text-center m-l-0">
						<!--remove product-->
						<a href="javascript:;" class="btn btn-sm btn-danger" data-click="remove-wishlist" data-index="{{ product.index }}" title="{{ '_' | jtext: 'MOD_JKASSA_WISHLIST_REMOVE' }}">
							<span class="fas fa-times"></span> {{ '_' | jtext: 'JACTION_DELETE' }}
						</a>
					</div>
				</div>
				{% endfor %}
			</div>
		</div>
	</div>
	{% else %}
	{% if text_empty %}
	<!--Text empty wishlist-->
	<div class="alert alert-info mt-2">
		{{ text_empty }}
	</div>
	{% endif %}
	{% endif %}
</div>