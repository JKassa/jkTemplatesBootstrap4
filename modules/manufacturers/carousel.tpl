{% assign rows		= manufacturers | arrayChunk: 4 %}
{% assign active	= 0 %}
{% assign dataslide	= 0 %}

<div id="mjkmCarousel_{{ mod_id }}" class="carousel slide" data-ride="carousel">
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
				{% for manufacturer in row %}
				<li class="col-3">
					<div class="card">
						<div style="height: {{ block_height }}px">
							<div class="card-body p-2">
								{% if manufacturer.thumbnail %}
								<div class="manufacturer-thumbnail text-center">
									<a href="{{ manufacturer.url }}" title="{{ manufacturer.name }}">
									<img src="{{ manufacturer.thumbnail }}" alt="{{ manufacturer.alias }}" style="max-height: 75px; max-width: 75px" />
									</a>
								</div>
								{% endif %}
								<div style="overflow: hidden; text-overflow: ellipsis; white-space: nowrap">
									<a href="{{ manufacturer.url }}" title="{{ manufacturer.name }}">
										{{ manufacturer.name }}
									</a>
									{% if products %}
									<small class="text-muted">({{ 'plural' | jtext: 		'MOD_JKASSA_MANUFACTURERS_PRODUCTS_QUANTITY', manufacturer.products_quantity }})</small>
									{% endif %}
								</div>
								{% if manufacturer.introtext %}
								<div class="mt-1" style="font-size: 11px; line-height: 14px">
									{{ manufacturer.introtext | truncateDesc: 35 }}
								</div>
								{% endif %}
							</div>
						</div>
						<div class="card-body p-2">
							{% if readmore %}
							<div class="mt-1">
								<a class="btn btn-outline-secondary btn-sm" href="{{ manufacturer.url }}">
									{{ '_' | jtext: 'JGLOBAL_DESCRIPTION' }} <span class="fas fa-arrow-right"></span>
								</a>
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
	<a class="carousel-control-prev carousel-control" href="#mjkmCarousel_{{ mod_id }}" role="button" data-slide="prev">&lsaquo;</a>
	<a class="carousel-control-next carousel-control" href="#mjkmCarousel_{{ mod_id }}" role="button" data-slide="next">&rsaquo;</a>
</div>