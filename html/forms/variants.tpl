{% for variant in variants %}
<div class="form-row">
	<div class="col-auto">
		<label>{{ variant.name }}</label>

		{% case variant.type %} 

		{% when 'select' %}
		<!--Drop-down list-->
		<select data-select="variant-select" name="variant-{{ product }}-{{ variant.id }}" class="custom-select custom-select-sm">
			{% for attribute in variant.attributes %}
			<option value="{{ attribute.value }}" data-attr-title="{{ attribute.title }}"{% if attribute.default %} selected{% endif %}>
				{{ attribute.value }}
			</option>
			{% endfor %}
		</select>

		{% when 'radio' %}
		<!--Group switches-->
		{% for attribute in variant.attributes %}
		<label class="variant-radio-value">
			<input type="radio" data-checked="variant-radio" data-attr-title="{{ attribute.title }}" name="variant-{{ product }}-{{ variant.id }}" value="{{ attribute.value }}"{% if attribute.default %} checked{% endif %}>
			{{ attribute.value }}
		</label>
		{% endfor %}

		{% when 'color' %}
		<!--Сolor switches-->
		{% for attribute in variant.attributes %}
		<label class="minicolors-swatch{% if attribute.default %} main{% endif %}" title="{{ attribute.title }}">
			<input type="radio" data-checked="variant-color" data-attr-title="{{ attribute.title }}" name="variant-{{ product }}-{{ variant.id }}" value="{{ attribute.value }}"{% if attribute.default %} checked{% endif %}>
			<span style="background-color: {{ attribute.value }};"></span>
		</label>
		{% endfor %}
		
		{% when 'texture' %}
		<!--Texture switches-->
		{% for attribute in variant.attributes %}
		<label class="minicolors-swatch{% if attribute.default %} main{% endif %}" title="{{ attribute.title }}">
			<input type="radio" data-checked="variant-texture" data-attr-title="{{ attribute.title }}" name="variant-{{ product }}-{{ variant.id }}" value="{{ attribute.value }}"{% if attribute.default %} checked{% endif %}>
			<img src="{{ attribute.img }}" alt="{{ attribute.alt }}">
		</label>
		{% endfor %}

		{% endcase %}
	</div>
	{% if variant.tooltip %}
	<div class="col-auto">
		<!--Tooltip-->
		<span class="hasTooltip" title="{{ variant.tooltip }}">
			<span class="fas fa-question-circle"></span>
		</span>
	</div>
	{% endif %}
</div>
{% endfor %}

{% if user_variants %}
<!--Reset variants-->
<a href="#" data-click="variant-reset" data-id="{{ product }}" class="small" title="{{ '_' | jtext: 'COM_JKASSA_RESET_VARIANTS_TITLE' }}">
	<span class="fas fa-sync"></span>
	{{ '_' | jtext: 'COM_JKASSA_RESET_VARIANTS' }}
</a>
{% endif %}