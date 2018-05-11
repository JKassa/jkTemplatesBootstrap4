<dl class="row">
	<dt class="col-sm-3">{{ '_' | jtext: 'COM_JKASSA_DELIVERY_METHOD'}}:</dt>
	<dd class="col-sm-9">{{ delivery.label }}</dd>
	{% if delivery.tooltip %}
	<dt class="col-sm-3">{{ '_' | jtext: 'COM_JKASSA_DELIVERY_DESC'}}:</dt>
	<dd class="col-sm-9">{{ delivery.tooltip }}</dd>
	{% endif %}
	<dt class="col-sm-3">{{ '_' | jtext: 'COM_JKASSA_DELIVERY_COST'}}:</dt>
	<dd class="col-sm-9">
		{% if delivery.cost == 0 %}
			{{ '_' | jtext: 'COM_JKASSA_FREE'}}
		{% else %}
			{{ delivery.cost | costDisplay }}{{ currency.symbol }}
		{% endif %}
	</dd>
	{% if delivery.free %}
	<dt class="col-sm-3">{{ '_' | jtext: 'COM_JKASSA_DELIVERY_FREE'}}:</dt>
	<dd class="col-sm-9">{{ delivery.free | costDisplay }}{{ currency.symbol }}</dd>
	{% endif %}
	{% if delivery_custom %}
	{% for custom in delivery_custom %}
	<dt class="col-sm-3">{{ custom.name }}</dt>
	<dd class="col-sm-9">{{ custom.value }}</dd>
	{% endfor %}
	{% endif %}
</dl>