<div class="mjkblock">
	<ul class="row list-unstyled">
		{% for manufacturer in manufacturers %}
		<li class="col-3">
			<div class="card mb-3">
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
							<small class="text-muted">({{ 'plural' | jtext: 'MOD_JKASSA_MANUFACTURERS_PRODUCTS_QUANTITY', manufacturer.products_quantity }})</small>
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