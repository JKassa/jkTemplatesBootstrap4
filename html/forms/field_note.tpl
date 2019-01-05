{% case field.default %}
	{% when 'message' %}
		{% assign class = ' alert-success' %}
	{% when 'notice' %}
		{% assign class = ' alert-info' %}
    {% when 'warning' %}
		{% assign class = ' alert-warning' %}
	{% when 'error' %}
		{% assign class = ' alert-danger' %}
	{% else %}
		{% assign class = ' alert-warning' %}
{% endcase %}
<div class="form-group row"{% if field.showon %} data-showon='{{ field.showon }}'{% endif %}>
	<div class="alert{{ class }}">
		{% if field.label %}<h4>{{ field.label }}</h4>{% endif %}
		{{ field.tooltip }}
		<button type="button" class="close" data-dismiss="alert" aria-label="Close">
			<span aria-hidden="true">&times;</span>
		</button>
	</div>
</div>