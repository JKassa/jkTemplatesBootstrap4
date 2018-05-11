{{ 'stylesheet' | jhtml: 'css/style.css' }}

{% case layout %}
	{% when 'accordion' %}
<div>
	{% assign start = 0 %}
	{% capture selector %}mjkcategories-accordion-{{ start }}{% endcapture %}
	<div id="{{ selector }}">
		{% include 'modules/categories/accordion' %}
	</div>
</div> 
    {% when 'dropdown' %}
<div class="dropdown">
	<ul class="dropdown-menu" aria-labelledby="dropdownMenuLink" style="display: block; width: 100%; margin-bottom: 20px; position: static;">
		{% include 'modules/categories/dropdown' %}
	</ul>
</div>
    {% else %}
<ul class="list-unstyled">
	{% include 'modules/categories/list' %}
</ul>
{% endcase %}