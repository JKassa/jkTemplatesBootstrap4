<div class="form-group row"{% if field.showon %} data-showon='{{ field.showon }}'{% endif %}>
	<label class="col-sm-4 col-form-label" for="{{ field.name }}">
		{{ field.label }}{% if field.required %} <span class="text-danger">*</span>{% endif %}
	</label>
	<div class="col-sm-8">
		<input
			type="email"
			id="{{ field.name }}"
			name="{{ field.name }}"
			value="{{ field.default }}"
			{% if field.placeholder %} placeholder="{{ field.placeholder }}"{% endif %}
			{% if field.required %} required{% endif %}
			{% if field.tooltip %} class="form-control hasTooltip" title="{{ field.tooltip }}" data-placement="right"{% else %} class="form-control"{% endif %}
		>
	</div>
</div>