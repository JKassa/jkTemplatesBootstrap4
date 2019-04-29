{% comment %}
	Connect CSS and JavaScript to the header of the document.
{% endcomment %}
{{ 'stylesheet' | jhtml: 'css/style.css' }}
{{ 'script' | jhtml: 'js/template.js' }}
{{ 'tooltip' | bootstrap4 }}
{{ 'popover' | bootstrap4 }}
{{ 'loadAll5' | fontawesome }}

{% if heading %}
<!--Heading-->
<h1>{{ heading }}</h1>
{% elsif title %}
<!--Title-->
<h2>{{ title }}</h2>
{% endif %}

{% if pretext %}
<!--Pretext-->
<div>
	{{ pretext }}
</div>
{% endif %}

{% if products or categories %}
{% if products %}
<!--List products-->
<form action="{{ form_action }}" method="post" name="productsForm" id="productsForm" class="mt-4">
	<div class="form-row align-items-center mb-3">
		<!--Sort by-->
		<div class="col-9 col-sm-4">
			<select data-select="products-sorting" name="product-sorting" class="custom-select custom-select-sm">
				{% for sort in sorting %}
				<option value="{{ sort.value }}" {{ sort.selected }}>{{ sort.title }}</option>
				{% endfor %}
			</select>
		</div>
		<div class="col-sm-1 d-none d-md-block">
			<select data-select="products-limit" title="{{ '_' | jtext: 'JSHOW' }}" class="custom-select custom-select-sm">
				{% for limit in limits %}
				<option value="{{ limit.value }}" {{ limit.selected }}>{{ limit.title }}</option>
				{% endfor %}
			</select>
		</div>
		<!--Switch product layout-->
		<div class="col-3 col-sm-7 text-right">
			<span class="btn-group">
				<a href="#" data-click="display-block" class="btn btn-sm btn-secondary {% if layout == 'block' %}active{% endif %}" title="{{ '_' | jtext: 'COM_JKASSA_DISPLAY_BLOCK' }}">
					<span class="fas fa-th-large"></span>
				</a>
				<a href="#" data-click="display-list" class="btn btn-sm btn-secondary {% if layout == 'list' %}active{% endif %}" title="{{ '_' | jtext: 'COM_JKASSA_DISPLAY_LIST' }}">
					<span class="fas fa-th-list"></span>
				</a>
			</span>
		</div>
	</div>

	<!--Layout products-->
	{{ products }}

	{% comment %}
		Code to add a link to submit an product.
	{% endcomment %}
	{% if create_icon %}
	<div class="btn btn-secondary mb-2">
		{{ create_icon }}
	</div>
	{% endif %}

	{% comment %}
		Pages links (pagination).
		See: html/pagination
	{% endcomment %}
	{{ pagesLinks }}
</form>
{% endif %}
  
{% comment %}
	Categories.
	See: views/category/categories.tpl
{% endcomment %}
{% if categories %}
{{ categories }}
{% endif %}
{% else %}
<!--No Matching Results-->
<div class="alert alert-warning mt-3">
	{{ '_' | jtext: 'COM_JKASSA_NO_MATCHING_RESULTS' }}
</div>
{% endif %}

{% if posttext %}
<!--Posttext-->
<div>
	{{ posttext }}
</div>
{% endif %}