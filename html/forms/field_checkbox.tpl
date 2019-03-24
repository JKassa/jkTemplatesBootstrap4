<div class="form-group row"{% if field.showon %} data-showon='{{ field.showon }}'{% endif %}>
	<label class="col-sm-4 col-form-label" for="{{ field.name }}">
		{{ field.label }}{% if field.required %} <span class="text-danger">*</span>{% endif %}
	</label>
	<div class="col-sm-8">
		<div class="checkbox">
			<label>
				<input
					type="checkbox"
					id="{{ field.name }}"
					name="{{ field.name }}"
					value="{{ field.default }}"
					{% if field.required %} required{% endif %}
					{% if field.readonly %} disabled{% endif %}
					{% if field.default == field.label %} checked{% endif %}
				>
				{{ value }}
				{% if field.tooltip %}
				<span class="fas fa-info-circle hasPopover" title="{{ field.label }}" data-content="{{ field.tooltip }}" data-placement="top"></span>
				{% endif %}
			</label>
		</div>
	</div>
</div>