{% comment %}
	Connect CSS and JavaScript to the header of the document.
{% endcomment %}
{{ 'stylesheet' | jhtml: 'css/style.css' }}
{{ 'script' | jhtml: 'js/template.js' }}
{{ 'tooltip' | bootstrap4 }}
{{ 'loadAll5' | fontawesome }}

{% if heading %}
<!--Heading-->
<h1>{{ heading }}</h1>
{% endif %}

{% if title %}
<!--Title-->
<h2>
	{{ title }}
	<small>({{ total }})</small>
</h2>
{% endif %}

{% if pretext %}
<!--Pretext-->
<div>
  {{ pretext }}
</div>
{% endif %}

{% if reviews %}
<!--Filters-->
<form action="{{ form_action }}" method="post" name="reviewsForm" id="reviewsForm" class="mt-4">
	<div class="align-items-center mb-3">
		<!--Sort by-->
		<i class="fa fa-filter" aria-hidden="true" title="{{ '_' | jtext: 'COM_JKASSA_SORT_TITLE' }}"></i>
		<select onchange="this.form.submit()" name="filter_order" class="custom-select custom-select-sm" style="width: auto;">
			{% for sort in sorting %}
			<option value="{{ sort.value }}"{{ sort.selected }}>{{ sort.title }}</option>
			{% endfor %}
		</select>
		<!--Limit-->
		<div class="float-right">
			{{ '_' | jtext: 'JGLOBAL_DISPLAY_NUM' }}
			<select onchange="this.form.submit()" name="limit" title="{{ '_' | jtext: 'JSHOW' }}" class="custom-select custom-select-sm" style="width: auto;">
				{% for limit in limits %}
				<option value="{{ limit.value }}"{{ limit.selected }}>{{ limit.title }}</option>
				{% endfor %}
			</select>
		</div>
	</div>
</form>

<!--Reviews-->
{% for review in reviews %}
<div class="card mb-3">
	<div class="card-header">
		<div class="media">
			<a href="{{ review.product_url }}" class="mr-3">
				<img class="media-object" alt="{{ review.product_alias }}" style="max-width: 64px; max-height: 64px;" src="{{ review.product_image }}">
			</a>
			<div class="media-body">
				<h4 class="mt-0">
					<a href="{{ review.product_url }}">
						{{ review.product_name }}
					</a>
				</h4>
				<!--Rating reviews-->
				<div class="m-t-10 text-muted" style="display: inline-block;">
					{% assign rating = review.product_rating %}
					{% assign rating_count = review.product_rating_count %}
					{% include 'html/reviews/rating' %}
				</div>
			</div>
		</div>
	</div>
	<div class="card-body">
		{% assign review_id     = review.id %}
		{% assign user_img      = review.user_img %}
		{% assign user_name     = review.user_name %}
		{% assign rating        = review.rating %}
		{% assign date     	    = review.date %}
		{% assign dignity       = review.dignity %}
		{% assign shortcomings  = review.shortcomings %}
		{% assign parent        = review.parent %}
		{% assign review_rating = review.review_rating %}
		{% assign children      = review.children %}
		{% assign product_id    = review.product_id %}
		{% assign review        = review.review %}
		{% include 'html/reviews/post' %}
	</div>
</div>
{% endfor %}
{% else %}
<div class="alert alert-warning">
	{{ '_' | jtext: 'COM_JKASSA_REVIEWS_COUNT_0' }}
</div>
{% endif %}

{% if posttext %}
<!--Posttext-->
<div>
  {{ posttext }}
</div>
{% endif %}

{% comment %}
	Pages links (pagination).
	See: html/pagination
{% endcomment %}
{{ pagesLinks }}