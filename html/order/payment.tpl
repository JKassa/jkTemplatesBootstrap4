<dl class="row">
	<dt class="col-sm-3">{{ '_' | jtext: 'COM_JKASSA_PAYMENT_METHOD' }}:</dt>
	<dd class="col-sm-9">{{ syst_name }}</dd>
	<dt class="col-sm-3">{{ '_' | jtext: 'COM_JKASSA_SHOP_ID' }}:</dt>
	<dd class="col-sm-9">{{ syst_id }}</dd>
	<dt class="col-sm-3">{{ '_' | jtext: 'COM_JKASSA_ORDER_NUMBER' }}:</dt>
	<dd class="col-sm-9">{{ pm_number }}</dd>
	<dt class="col-sm-3">{{ '_' | jtext: 'COM_JKASSA_ORDER_ID' }}:</dt>
	<dd class="col-sm-9">{{ order_id }}</dd>
	<dt class="col-sm-3">{{ '_' | jtext: 'COM_JKASSA_ORDER_TOTALL' }}:</dt>
	<dd class="col-sm-9">{{ pm_in_total | costDisplay }}{{ currency.symbol }}</dd>
	<dt class="col-sm-3">{{ '_' | jtext: 'COM_JKASSA_ORDER_CREATED' }}:</dt>
	<dd class="col-sm-9">{{ 'date' | jhtml: created, 'd F Y H:i' }}</dd>
	<dt class="col-sm-3">{{ '_' | jtext: 'COM_JKASSA_ORDER_DESC' }}:</dt>
	<dd class="col-sm-9">{{ pm_desc }}</dd>
	<dt class="col-sm-3">{{ '_' | jtext: 'COM_JKASSA_ORDER_STATE' }}:</dt>
	<dd class="col-sm-9">
		{{ order_status }}
		{% if description %}
		<br>
		<small><em>* {{ description }}</em></small>
		{% endif %}
	</dd>
	{% if syst_extra %}
	{% for extra in syst_extra %}
	<dt class="col-sm-3">{{ extra.name }}</dt>
	<dd class="col-sm-9">{{ extra.value }}</dd>
	{% endfor %}
	{% endif %}
</dl>