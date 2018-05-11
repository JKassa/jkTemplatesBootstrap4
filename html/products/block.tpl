<div class="block-products">
	<ul class="cards list-unstyled row">
		{% for product in products %}
		<li class="col-12 col-sm-6 col-md-{{ col_md }}" itemscope itemtype="http://schema.org/Product">
			<div class="over-wraper">
				<div class="card over-wraper-long">
					<div class="product-image">
						{% if product.stickers %}
						<!-- Stickers -->
						<ul class="stickers">
							{% if product.new %}
							<li>
								<span class="product-label product-label_new">NEW</span>
							</li>
							{% endif %}
							{% if product.hit %}
							<li>
								<span class="product-label product-label_hit">HIT</span>
							</li>
							{% endif %}
							{% if product.discount %}
							<li>
								{% assign options = 'decimals' | arrayCombine: 0 %}
								{% if product.discount_image %}
								<img {{ product.discount_image | img_exists: '30x30' }} alt="" title="{{ product.discount_desc }} - {{ product.discount | costDisplay: options }}{{ product.d_symbol }}">
								{% else %}
								<span class="product-label" title="{{ product.discount_desc }} - {{ product.discount | costDisplay: options }}{{ product.d_symbol }}">
									-{{ product.discount | costDisplay: options }}{% if product.d_symbol == '%' %}{{ product.d_symbol }}{% endif %}
								</span>
								{% endif %}
							</li>
							{% endif %}
						</ul>
						{% endif %}

						{% if product.manufacturer %}
						<!--Manufacturer name and miniature-->
						<div style="position: absolute; right:0; top:0;" itemtype="http://schema.org/Brand" itemscope itemprop="brand">
							<span style="display: none;" itemprop="name">{{ product.manufacturer.name }}</span>
							<img {{ product.manufacturer.thumbnail | img_exists: '30x30' }} class="manufacturer hasTooltip" itemprop="logo" alt="{{ product.manufacturer.alias }}" title="{{ product.manufacturer.name }}">
						</div>
						{% endif %}

						{% if product.tags %}
						<!-- Tags -->
						<div style="position: absolute; right: 0; bottom: 4px">
							{% for tag in product.tags %}
							<a href="{{ tag.url }}" class="{{ tag.link_class }}" style="float: right; border-radius: 9px 0 0 9px; margin-top: 2px">
								{{ tag.title }}
							</a><br>
							{% endfor %}
						</div>
						{% endif %}

						<!--Product Image-->
						<div class="text-center">
							{% assign jkmedialist = product.image | jkmedialist: product.images, '', img_style, product.url %}
							{% if jkmedialist %}
								{{ jkmedialist }}
							{% else %}
							<a href="{{ product.url }}" target="_top">
								<img {{ product.image | img_exists: '104x150' }} alt="{{ product.alias }}" style="{{ img_style }}" />
							</a>
							{% endif %}
						</div>

						<!--Quick view-->
						{% capture selector_quick_view %}jk-quick_view-{{ product.id }}{% endcapture %}
						<div class="quick-view d-none d-sm-block">
							<a href="#" data-click="show-modal" data-id="{{ selector_quick_view }}" data-src="{{ product.quick_url }}" class="btn btn-secondary btn-sm jk-quick_view" title="{{ 'sprintf' | jtext: 'COM_JKASSA_QUICK_VIEW_TITLE', product.name }}">
								<span class="fas fa-search-plus"></span>
								{{ '_' | jtext: 'COM_JKASSA_QUICK_VIEW' }}
							</a>
						</div>

						{% if product.present %}
						<!--Share (Product as a present)-->
						<div class="share hasTooltip" title="{{ 'tooltipText' | jhtml: product.present.name, product.present.desc }}">
							<div class="sharetitle">
								{{ '_' | jtext: 'COM_JKASSA_GIFT' }}
							</div>
							<div class="sharedesc">
								<a href="{{ product.present.url }}" target="_top">
									<img {{ product.present.image | img_exists: '50x50' }} alt="{{ product.present.name }}">
								</a>
							</div>
						</div>
						{% endif %}
					</div>
					
					<div class="card-body p-2">
						<!--Name and URL of the product-->
						<h5 class="card-title">
							<a href="{{ product.url }}" target="_top">
								<span itemprop="name">{{ product.name }}</span>
							</a>
							{% if product.files %}
							<!--Files-->
							<small class="text-muted hasTooltip" title="<strong>{{ '_' | jtext: 'COM_JKASSA_ATTACHMENT' }}:</strong><br>{{ product.files | join: '<br>' }}">
								<i class="fas fa-download fa-xs"></i>
							</small>
							{% endif %}
						</h5>

						<!--Price product-->
						<div class="mt-2" itemprop="offers" itemscope itemtype="http://schema.org/Offer">
							{% if product.old_cost %}
							<!--old cost-->
							<del class="text-muted">{{ product.old_cost | costDisplay }}{{ currency.symbol }}</del>
							{% endif %}
							<!--cost-->
							<span class="cost">
								<meta itemprop="priceCurrency" content="{{ currency.code }}" />
								{% assign options = 'dec_point,thousands_sep' | arrayCombine: '.', '*' %}
								<span itemprop="price" content="{{ product.cost | costDisplay: options }}">{{ product.cost | costDisplay }}</span>{{ currency.symbol }}
							</span>
							{% if product.vat %}
							<span class="text-muted small">
								({{ 'sprintf' | jtext: 'COM_JKASSA_VAT_INCL', product.vat }})
							</span>
							{% endif %}
						</div>

						{% if show_stock %}
						<!--Stock-->
						<div class="text-muted text-right">
							<small>
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
							</small>
						</div>
						{% endif %}

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

						{% comment %}
							Variants product.
							See: html\forms\variants.tpl
						{% endcomment %}
						{% if product.variants %}
						<div>
							{{ product.variants }}
						</div>
						{% endif %}

						{% if product.cart_disabled != 'false' and show_quantity %}
						<!--Quantity-->
						<div class="input-group qty-product mt-2 p-0">
							<div class="input-group-prepend">
								<a href="javascript:;" class="btn btn-secondary btn-sm" type="button" data-click="qty-minus" data-id="{{ product.id }}" title="{{ '_' | jtext: 'COM_JKASSA_QTY_BTN' }}">&minus;</a>
							</div>
							<input type="text" value="{{ product.limit }}" data-limit="{{ product.limit }}" data-maxlimit="{{ product.maxlimit }}" class="form-control form-control-sm text-center" name="qty-product-{{ product.id }}" title="{{ '_' | jtext: 'COM_JKASSA_QTY_TITLE' }}" style="max-width: 50px;">
							<div class="input-group-append">
								<a href="javascript:;" class="btn btn-secondary btn-sm" type="button" data-click="qty-plus" data-id="{{ product.id }}" title="{{ '_' | jtext: 'COM_JKASSA_QTY_BTN' }}">+</a>
							</div>
						</div>
						{% endif %}

						<!--Buttons-->
						<div class="btn-group mt-2" style="width: 100%">
							<!--More-->
							<a href="{{ product.url }}" class="btn btn-sm btn-outline-secondary" title="{{ 'sprintf' | jtext: 'COM_JKASSA_READ_MORE', product.name }}" itemprop="url" target="_top">
								<span class="fas fa-arrow-circle-right"></span>
							</a>
							<!--Add to cart-->
							{% if product.cart_disabled %}
							<span class="btn btn-sm btn-primary disabled" title="{{ product.cart_title }}">
								<span class="fas fa-shopping-cart"></span>
							</span>
							{% else %}
							<a href="#" data-click="to-cart" data-id="{{ product.id }}" class="btn btn-sm btn-primary" title="{{ product.cart_title }}">
								<span class="fas fa-shopping-cart"></span>
							</a>
							{% endif %}
							<!--Add to Wish List-->
							{% if product.wishlist_disabled %}
							<span class="btn btn-sm btn-danger disabled" title="{{ 'sprintf' | jtext: 'COM_JKASSA_ALREADY_WISHLIST', product.name }}">
								<span class="fas fa-heart"></span>
							</span>
							{% else %}
							<a href="#" data-click="to-wishlist" data-id="{{ product.id }}" class="btn btn-sm btn-danger" title="{{ 'sprintf' | jtext: 'COM_JKASSA_TO_WISHLIST_TITLE', product.name }}">
								<span class="fas fa-heart"></span>
							</a>
							{% endif %}
							<!--Add to compare-->
							{% if product.compare_disabled %}
							<span class="btn btn-sm btn-secondary disabled" title="{{ 'sprintf' | jtext: 'COM_JKASSA_COMPARE_ALREADY_ADDED', product.name }}">
								<span class="fas fa-random"></span>
							</span>
							{% else %}
							<a href="#" data-click="to-compare" data-id="{{ product.id }}" class="btn btn-sm btn-secondary" title="{{ 'sprintf' | jtext: 'COM_JKASSA_COMPARE_ADD_TITLE', product.name}}">
								<span class="fas fa-random"></span>
							</a>
							{% endif %}

							{% comment %}
								Connecting comments plugin.
								See: Plugin Manager: Plugins -> jkcomments.
							{% endcomment %}
							{% capture title_comments %}<span class="fas fa-comment"></span> [COUNT]{% endcapture %}
							{% assign count_comments = product.id | jkcountercomments: title_comments, product.url, 'btn btn-sm btn-dark' %}
							{% if count_comments %}
								{{ count_comments }}
							{% endif %}
						</div>

						<!--Product Description (introtext)-->
						<span itemprop="description" style="display: none">
							{{ product.introtext | truncateDesc: 140 }}
						</span>
					</div>
				</div>
			</div>
			{% comment %}
				Madal body for Quick view.
			{% endcomment %}
			{{ 'renderModal' | bootstrap4: selector_quick_view, 'modal-lg', product.name, '', '', true }}
		</li>
		{% endfor %}
		{% if moreProducts %}
		<!--More products-->
		<li class="col-12 col-sm-6 col-md-{{ col_md }}">
			<div class="over-wraper">
				<div class="card over-wraper-long crossblock">
					<a href="#" data-click="more-products" data-more="{{ moreProducts }}" data-limit="{{ selectedLimit }}">
						<div class="cross">
							<span>&#10227;</span>
						</div>
						<div class="card-body p-2 text-center">
							<h5>{{ 'plural' | jtext: 'COM_JKASSA_MORE_PRODUCTS', moreProducts }}</h5>
						</div>
					</a>
				</div>
			</div>
		</li>
		{% endif %}
	</ul>
</div>