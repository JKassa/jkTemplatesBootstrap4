{% comment %}
	Connect CSS and JavaScript to the header of the document.
{% endcomment %}
{{ 'stylesheet' | jhtml: 'css/style.css' }}
{{ 'script' | jhtml: 'js/template.js' }}

<!--Header-->
{% if heading %}
<h1>{{ heading }}</h1>
{% else %}
<h2>{{ title }}</h2>
{% endif %}

{% if pretext %}
<!--Pretext-->
<div>
	{{ pretext }}
</div>
{% endif %}

<!--List items-->
{% if items %}
<form action="{{ form_action }}" method="post" name="manufacturersForm" id="manufacturersForm">
	<div class="form-row align-items-center mb-3">
		<div class="col-12 text-right">
			{{ '_' | jtext: 'JGLOBAL_DISPLAY_NUM' }}
			{{ limit }}
		</div>
	</div>
	{% for item in items %}
	<div class="media">
		<a class="img-thumbnail mr-3" href="{{ item.url }}">
			<img {{ item.thumbnail | img_exists: '35x35' }} alt="{{ item.alias }}" />
		</a>
		<div class="media-body">
			<h5 class="mt-0">
				<a href="{{ item.url }}">
					{{ item.name }}
					<small class="text-muted">
						({{ 'plural' | jtext: 'COM_JKASSA_PRODUCTS_QUANTITY', item.products_quantity }})
					</small>
				</a>
			</h5>
			{{ item.introtext }}
		</div>
	</div>
	{% endfor %}

	{% comment %}
		Pages links (pagination).
		See: html/pagination
	{% endcomment %}
	{{ pagesLinks }}
</form>
{% else %}
<div class="alert alert-warning">
	{{ no_items }}
</div>
{% endif %}

{% if posttext %}
<!--Posttext-->
<div class="mt-3">
	{{ posttext }}
</div>
{% endif %}

{% comment %}
    Connecting comments plugin.
    See: Plugin Manager: Plugins -> jkcomments.
{% endcomment %}
{{ Itemid | jkcomments: title }}