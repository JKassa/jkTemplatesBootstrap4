{{ 'stylesheet' | jhtml: 'css/style.css' }}

<form action="{{ action }}" method="post" id="mod_jkassa_filter_form">
	<div id="filtersAccordian">
		{% if filter_cost %}
		<!--Filter cost-->
		<div class="card mb-1">
			<div class="card-header py-2" id="headingFilterCost">
				<h5 class="mb-0">
					<a href="#" class="btn btn-link p-0" data-toggle="collapse" data-target="#filterCost" aria-expanded="true" aria-controls="filterCost">
						{{ 'sprintf' | jtext: 'MOD_JKASSA_FILTER_COST', symbol }}
					</a>
				</h5>
			</div>
			<div id="filterCost" class="collapse show" aria-labelledby="headingFilterCost" data-parent="#filtersAccordian">
				<div class="card-body">
					<!--Slider-->
					{% if slider %}
					<div class="jk-slider-filter mb-1">
						<div id="jk_slider_filter"></div>
					</div>
					{% endif %}
					<!--Costs-->
					<div class="row">
						<div class="col">
							<div class="input-group">
								<div class="input-group-prepend">
									<span class="input-group-text">
										{{ '_' | jtext: 'MOD_JKASSA_FILTER_ON' }}
									</span>
								</div>
								<input type="text" id="min_cost" name="min_cost" placeholder="{{ min_default }}" class="form-control" value="{{ min_cost }}" />
							</div>
						</div>
						<div class="col">
							<div class="input-group">
								<input type="text" id="max_cost" name="max_cost" placeholder="{{ max_default }}" class="form-control" value="{{ max_cost }}" />
								<div class="input-group-append">
									<span class="input-group-text">
										{{ '_' | jtext: 'MOD_JKASSA_FILTER_TO' }}
									</span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		{% endif %}

		{% if manufacturers %}
		<!--Filter manufacturers-->
		<div class="card mb-1">
			<div class="card-header py-2" id="headingFilterManufacturers">
				<h5 class="mb-0">
					<a href="#" class="btn btn-link p-0" data-toggle="collapse" data-target="#filterManufacturers" aria-expanded="false" aria-controls="filterManufacturers">
						{{ '_' | jtext: 'MOD_JKASSA_FILTER_MANUFACTURERS' }}
					</a>
				</h5>
			</div>
			<div id="filterManufacturers" class="collapse" aria-labelledby="headingFilterManufacturers" data-parent="#filtersAccordian">
				<div class="card-body">
					{% for manufacturer in manufacturers %}
					<div class="checkbox">
						<label>
							<input
								id="manufacturer_{{ manufacturer.id }}"
								type="checkbox"
								name="manufacturer[]"
								value="{{ manufacturer.id }}"
								{% if manufacturer.checked %}checked{% endif %}
							/>
							{% if manufacturer.thumbnail %}
							<img src="{{ manufacturer.thumbnail }}" alt="{{ manufacturer.alias }}" style="max-height: 50px; max-width: 50px;" />
							{% endif %}
							{{ manufacturer.name }}
							{% if manufacturer.products %}
							<small class="text-muted">
								({{ manufacturer.products }})
							</small>
							{% endif %}
						</label>
					</div>
					{% endfor %}
				</div>
			</div>
		</div>
		{% endif %}

		{% if attributes %}
		<!--Filter attributes-->
		{% for attribute in attributes %}
		{% capture filter_attr %}filterAttribute_{{ attribute.id }}{% endcapture %}
		<div class="card mb-1">
			<div class="card-header py-2" id="heading{{ filter_attr }}">
				<h5 class="mb-0">
					<a href="#" class="btn btn-link p-0" data-toggle="collapse" data-target="#{{ filter_attr }}" aria-expanded="false" aria-controls="{{ filter_attr }}">
						{{ attribute.name }}
						{% if attribute.tooltip %}
						<span class="hasTooltip" title="{{ attribute.tooltip }}">
							<i class="fas fa-info-circle"></i>
						</span>
						{% endif %}
					</a>
				</h5>
			</div>
			<div id="{{ filter_attr }}" class="collapse" aria-labelledby="heading{{ filter_attr }}" data-parent="#filtersAccordian">
				<div class="card-body">
					{% for value in attribute.values %}
					<div class="checkbox">
						<label>
							<input
								id="attribute_{{ attribute.id }}_{{ value.key }}"
								type="checkbox"
								name="attribute[{{ attribute.id }}][]"
								value="{{ value.val }}"
								{% if value.checked %}checked{% endif %}
								{% if value.disabled %}disabled{% endif %}
							/>
							{% if value.disabled %}<small class="text-muted">{% endif %}
							{{ value.val }} {{ attribute.prefix }}
							{% if value.disabled %}</small>{% endif %}
							{% if value.count %}
							<small class="text-muted">
								({{ value.count }})
							</small>
							{% endif %}
						</label>
					</div>
					{% endfor %}
				</div>
			</div>
		</div>
		{% endfor %}
		{% endif %}
	</div>

	{% if show_ok or show_reset %}
	<!--Buttons-->
	<div class="btn-group mt-2">
		{% if show_ok %}
		<button type="button" class="btn btn-sm btn-primary" data-click="submit-filter">
			<span class="fas fa-check"></span>
			{{ '_' | jtext: 'MOD_JKASSA_FILTER_OK' }}
		</button>
		{% endif %}
		{% if show_reset %}
		<button type="button" class="btn btn-secondary btn-sm" data-click="reset-filter">
			<span class="fas fa-sync"></span>
			{{ '_' | jtext: 'MOD_JKASSA_FILTER_RESET' }}
		</button>
		{% endif %}
	</div>
	{% endif %}
</form>