<li class="page-item">
	<a href="#" data-click="pages-links" data-return="{{ link }}" title="{{ text }}" class="page-link">
		{% case action %}
			{% when 'start' %}
				<span class="fas fa-backward"></span>
			{% when 'previous' %}
				<span class="fas fa-chevron-left"></span>
			{% when 'next' %}
				<span class="fas fa-chevron-right"></span>
			{% when 'end' %}
				<span class="fas fa-forward"></span>
			{% else %}
				{{ text }}
		{% endcase %}
	</a>
</li>