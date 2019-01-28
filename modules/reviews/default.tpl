{{ 'stylesheet' | jhtml: 'css/style.css' }}
{{ 'loadAll5' | fontawesome }}

{% if reviews %}
<ul class="list-unstyled">
	{% for review in reviews %}
	<li class="media">
		{% if show_avatar %}
		<img src="{{ review.user_img }}" alt="{{ review.user_name }}" class="mr-2 rounded-circle" style="width: 44px; height: 44px;">
		{% endif %}
		<div class="media-body">
			<h5 class="mt-0 mb-1">
				{{ review.user_name }} - <a href="{{ review.product_url }}">{{ review.product_name }}</a>
				{% if show_date %}
				<small class="float-right">
					<i class="far fa-clock"></i> {{ review.date }}
				</small>
				{% endif %}
			</h5>
			<p>{{ review.review }}</p>
		</div>
	</li>
	{% endfor %}
</ul>
{% else %}
<!--No reviews yet-->
<div class="alert alert-warning">
	{{ '_' | jtext: 'MOD_JKASSA_REVIEWS_NO' }}
</div>
{% endif %}