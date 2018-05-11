{% for category in categories %}
<li class="level_{{ category.level }}{% if category.children %} dropdown-submenu{% endif %}{% if category.active %} active{% endif %}">
	<a href="{{ category.url }}" class="dropdown-item">
		{{ category.title }}
		{% if category.qty_products %}
		<small>
			<span class="badge badge-secondary">
				{{ category.qty_products }}
			</span>
		</small>
		{% endif %}
	</a>
	{% if category.children %}
	<ul class="dropdown-menu">
		{% assign assigns = 'categories,submenu' | arrayCombine: category.children, submenu %}
		{{ assigns | layoutRender: 'modules/categories', 'dropdown' }}
	</ul>
	{% endif %}
</li>
{% endfor %}