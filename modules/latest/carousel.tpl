{% assign rows		= products | arrayChunk: 4 %}
{% assign active	= 0 %}
{% assign dataslide	= 0 %}

<div id="mjklCarousel_{{ mod_id }}" class="carousel slide" data-ride="carousel" data-interval="{{ interval }}">
	<ol class="carousel-indicators">
		{% for row in rows %}
		<li data-target="#mjklCarousel_{{ mod_id }}" data-slide-to="{{ dataslide }}" class="{% if dataslide == 0 %}active{% endif %}"></li>
		{% assign dataslide = dataslide | plus: 1 %}
		{% endfor %}
	</ol>
	<div class="carousel-inner">
		{% for row in rows %}
		{% assign active = active | plus: 1 %}
		<div class="carousel-item{% if active == 1 %} active{% endif %}">
			<ul class="row list-unstyled">
				{% for product in row %}
				<li itemscope itemtype="http://schema.org/Product" class="col-12 col-sm-6 col-md-3">
					<div class="card">
						<div style="{{ block_height }}">
							{% if product.image %}
							<div class="product-image text-center">
								<a itemprop="url" href="{{ product.url }}" title="{{ product.name }}">
									<img itemprop="image" src="{{ product.image }}" alt="{{ product.alias }}" style="{{ img_height }}" />
								</a>
							</div>
							{% endif %}
							<div class="card-body p-2">
								<div style="overflow: hidden; text-overflow: ellipsis; white-space: nowrap">
									<a itemprop="url" href="{{ product.url }}" title="{{ product.name }}">
										<span itemprop="name">{{ product.name }}</span>
									</a>
								</div>
								{% if product.introtext %}
								<div class="mt-1" style="font-size: 11px; line-height: 14px">
									<span itemprop="description">
										{{ product.introtext | truncateDesc: 35 }}
									</span>
								</div>
								{% endif %}
								{% if product.cost and product.old_cost %}
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
							{% if show_stock %}
							<!--Stock-->
							<div class="text-muted mt-1 text-right small">
								{% case product.stock %} 
									{% when 0 %}
										<!--Not available-->
										{{ '_' | jtext: 'COM_JKASSA_STOCK_0' }}
									{% when '-1' %}
										<!--Available-->
										{{ '_' | jtext: 'COM_JKASSA_STOCK_1' }}
									{% when '-2' %}
										<!--Under the order-->
										{{ '_' | jtext: 'COM_JKASSA_STOCK_2' }}
									{% else %}
										<!--Number-->
										{{ '_' | jtext: 'COM_JKASSA_STOCK' }}: {{ product.stock }}
								{% endcase %}
							</div>
							{% endif %}
							{% if show_votes %}
							{% comment %}
								Rating reviews JKassa or Plug-in voting (See: Plugin Manager: Plugins -> jkvotes).
							{% endcomment %}
							{% if reviews_included %}
							<!--Rating reviews-->
							<div class="text-right" title="{{ 'plural' | jtext: 'COM_JKASSA_REVIEWS_COUNT', product.rating_count }}">
								{% for i in (1..5) %}
								{% if product.rating >= i %}
								<span class="fas fa-star" style="color: #F2CD00"></span>
								{% else %}
								<span class="far fa-star" style="color: #CCCCCC"></span>
								{% endif %}
								{% endfor %}
							</div>
							{% else %}
							{% assign votes = product.id | jkcountervotes: product.rating, product.rating_count %}
							{% if votes %}
							<!--Voting-->
							<div class="text-right">
								{{ votes }}
							</div>
							{% endif %}
							{% endif %}
							{% endif %}
							{% if btns %}
							<div class="btn-group mt-1">
								{% if readmore %}
								<!--More-->
								<a itemprop="url" class="btn btn-secondary btn-sm" href="{{ product.url }}">
									<span class="fas fa-arrow-circle-right"></span>
									{% if btns == 1 %}{{ '_' | jtext: 'JGLOBAL_DESCRIPTION' }}{% endif %}
								</a>
								{% endif %}
								{% if to_cart %}
								<!--Add to cart-->
								{% if product.cart_disabled %}
								<span class="btn btn-sm btn-primary disabled" title="{{ product.cart_title }}">
									<span class="fas fa-shopping-cart"></span>
									{% if btns == 1 %}{{ '_' | jtext: 'COM_JKASSA_TO_CART' }}{% endif %}
								</span>
								{% else %}
								<a href="#" data-click="to-cart" data-id="{{ product.id }}" data-json="{{ mod_id }}" class="btn btn-sm btn-primary" title="{{ product.cart_title }}">
									<span class="fas fa-shopping-cart"></span>
									{% if btns == 1 %}{{ '_' | jtext: 'COM_JKASSA_TO_CART' }}{% endif %}
								</a>
								{% endif %}
								{% endif %}
								{% if to_wishlist %}
								<!--Add to Wish List-->
								{% if product.wishlist_disabled %}
								<span class="btn btn-sm btn-danger disabled" title="{{ 'sprintf' | jtext: 'COM_JKASSA_ALREADY_WISHLIST', product.name }}">
									<span class="fas fa-heart"></span>
									{% if btns == 1 %}{{ '_' | jtext: 'COM_JKASSA_TO_WISHLIST' }}{% endif %}
								</span>
								{% else %}
								<a href="#" data-click="to-wishlist" data-id="{{ product.id }}" data-json="{{ mod_id }}" class="btn btn-sm btn-danger" title="{{ 'sprintf' | jtext: 'COM_JKASSA_TO_WISHLIST_TITLE', product.name }}">
									<span class="fas fa-heart"></span>
									{% if btns == 1 %}{{ '_' | jtext: 'COM_JKASSA_TO_WISHLIST' }}{% endif %}
								</a>
								{% endif %}
								{% endif %}
								{% if to_compare %}
								<!--Add to compare-->
								{% if product.compare_disabled %}
								<span class="btn btn-sm btn-secondary disabled" title="{{ 'sprintf' | jtext: 'COM_JKASSA_COMPARE_ALREADY_ADDED', product.name }}">
									<span class="fas fa-random"></span>
									{% if btns == 1 %}{{ '_' | jtext: 'COM_JKASSA_COMPARE_ADD' }}{% endif %}
								</span>
								{% else %}
								<a href="#" data-click="to-compare" data-id="{{ product.id }}" data-json="{{ mod_id }}" class="btn btn-sm btn-secondary" title="{{ 'sprintf' | jtext: 'COM_JKASSA_COMPARE_ADD_TITLE', product.name}}">
									<span class="fas fa-random"></span>
									{% if btns == 1 %}{{ '_' | jtext: 'COM_JKASSA_COMPARE_ADD' }}{% endif %}
								</a>
								{% endif %}
								{% endif %}
							</div>
							{% endif %}
						</div>
					</div>
				</li>
				{% endfor %}
			</ul>
		</div>
		{% endfor %}
	</div>
	<a class="carousel-control-prev carousel-control" href="#mjklCarousel_{{ mod_id }}" role="button" data-slide="prev">&lsaquo;</a>
	<a class="carousel-control-next carousel-control" href="#mjklCarousel_{{ mod_id }}" role="button" data-slide="next">&rsaquo;</a>
</div>