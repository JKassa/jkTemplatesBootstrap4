{{ 'stylesheet' | jhtml: 'css/style.css' }}
{{ 'loadAll5' | fontawesome }}

{% comment %}
	HTML code for the popover window.
{% endcomment %}
{% capture popover_html %}
<div class="row">
	{% if image %}
	<!--Image-->
	<div class="col-3">
		<a href="{{ url_wishlist }}">
			<img alt="wishlist" src="{{ image }}" title="{{ image_title }}">
		</a>
	</div>
	{% endif %}
	<div class="{% if image %}col-9{% else %}col-12{% endif %}">
		{% if products %}
		<ul class="list-unstyled">
			{% for product in products %}
			<li>
				<a href="{{ product.url }}" target="_blank">
					{{ product.name }}
				</a>
				<!--remove product-->
				<a href="javascript:;" data-click="remove-wishlist" data-index="{{ product.index }}" title="{{ '_' | jtext: 'MOD_JKASSA_WISHLIST_REMOVE' }}">
					<span class="fas fa-times text-danger" style="font-size:10px"></span>
				</a>
			</li>
			{% endfor %}
		</ul>
		{% else %}
		<p class="text-muted">
			<em>
				{% if text_empty %}
					{{ text_empty }}
				{% else %}
					{{ '_' | jtext: 'COM_JKASSA_ACCOUNT_WISHLIST_EMPTY' }}
				{% endif %}
			</em>
		</p>
		{% endif %}
	</div>
</div>
{% if products %}
<!--URLs: Go to wish list & Remove from wishlist-->
<div class="card-footer text-center" style="margin: 0 -12px -8px;">
	<a href="{{ url_wishlist }}" class="btn btn-sm btn-secondary">
		<i class="fas fa-chevron-right"></i>
		{{ '_' | jtext: 'JLIB_HTML_VIEW_ALL' }}
	</a>
	<a href="#" class="btn btn-sm btn-danger" data-click="remove-wishlist-all">
		<i class="fas fa-trash"></i>
		{{ '_' | jtext: 'JSEARCH_FILTER_CLEAR' }}
	</a>
</div>
{% endif %}
{% endcapture %}

<div id="jk-wishlist-module">
	<div class="jk-wishlist-popover">
		<a href="javascript:;" data-toggle="popover" style="display: block; position: relative; width: 30px; height: 30px">
			<span style="display: block; margin: 5px 0 0 5px">
				<i class="fas fa-heart fa-2x"></i>
			</span>
			<span style="top: -5px; right: -10px; position: absolute">
				<span class="badge badge-secondary"{% if products %} style="background-color: #337ab7"{% endif %}>{{ quantity }}</span>
			</span>
		</a>
	</div>
	<div class="jk-wishlist-popover-content" style="display: none;">
		{{ popover_html }}
	</div>
	<script type="text/javascript">
		jQuery(document).ready(function () {
			"use strict";
			jQuery('.jk-wishlist-popover a').popover({
				html: true,
				placement: 'bottom',
				container: 'body',
				title: "{{ '_' | jtext: 'MOD_JKASSA_WISHLIST_YOUR_WISHLIST' }}",
				content: function () {
					return jQuery('.jk-wishlist-popover-content').html();
				}
			}).click(function (e) {
				e.preventDefault();
				jQuery(this).focus();
			});
			jQuery(document).mouseup(function (e) {
				var container = jQuery('.jk-wishlist-popover');

				if (container.has(e.target).length === 0) {
					jQuery('.jk-wishlist-popover a').popover('hide');
				}
			});
		});
	</script>
</div>