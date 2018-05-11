{% for category in categories %}
	{% capture headingId %}headingSlider-{{ category.id }}{% endcapture %}
	{% capture collapseId %}collapseSlider-{{ category.id }}{% endcapture %}
	{% assign expanded = 'false' %}
	{% if category.active %}
		{% assign expanded = 'true' %}
		{% assign active = ' show' %}
	{% endif %}
  
 <div class="card mb-1">
    <div class="card-header py-2" id="{{ headingId }}">
		<h5 class="mb-0">
			<button class="btn btn-link p-0 float-left" data-toggle="collapse" data-target="#{{ collapseId }}" aria-expanded="{{ expanded }}" aria-controls="{{ collapseId }}">
				{{ category.title }}
			</button>
			{% if category.qty_products %}
			<small class="float-right" style="margin-top: 2px;">
				<i class="badge badge-secondary badge-pill">{{ category.qty_products }}</i>
			</small>
			{% endif %}
		</h5>
    </div>
    <div id="{{ collapseId }}" class="collapse{{ active }}" aria-labelledby="{{ headingId }}" data-parent="#{{ selector }}">
		<div class="card-body p-2">
			{% if category.image %}
			<a href="{{ category.url }}">
				<img src="{{ category.image }}" alt="{{ category.alias }}" style="display: block; max-height: 50px; max-width: 50px;" />
			</a>
			{% endif %}
			{% if category.description %}
			<p style="font-size: 10px; line-height: 10px;">
				{{ category.description | truncateDesc: 100 }}
			</p>
			{% endif %}
			<div style="clear: both;"></div>
			<p class="readmore" style="text-align: right;">
				<a href="{{ category.url }}" class="btn btn-sm btn-secondary" data-placement="left" title="{{ 'sprintf' | jtext: 'MOD_JKASSA_CATEGORIES_GO_TITLE', category.title }}">
					<span class="fas fa-arrow-right"></span>
					{{ '_' | jtext: 'MOD_JKASSA_CATEGORIES_GO' }}
				</a>
			</p>

			{% assign startTemp = start %}

			{% if category.children %}
			{% increment start %}
			{% capture selector %}mjkcategories-accordion-{{ start }}{% endcapture %}
			<div id="{{ selector }}">
				{% assign assigns = 'categories,start' | arrayCombine: category.children, start %}
				{{ assigns | layoutRender: 'modules/categories', 'accordion' }}
			</div>
			{% endif %}

			{% assign start = startTemp %}
		</div>
    </div>
 </div>
{% endfor %}