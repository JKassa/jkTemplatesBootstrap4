<nav aria-label="Page navigation">
	<div class="float-right mt-2 text-muted">
		{{ pagesCounter }}
	</div>
	<ul class="pagination pagination-sm">
		{{ start.data }}
		{{ previous.data }}
		{% for page in pages %}
			{{ page.data }}
		{% endfor %}
		{{ next.data }}
		{{ end.data }}
	</ul>
</nav>