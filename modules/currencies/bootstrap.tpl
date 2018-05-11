{% for currency in currencies %}
{% if currency.id == active_id %}
<button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownCurrencies" data-toggle="dropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	<img src="{{ currency.image }}" alt="{{ currency.code }}" title="{{ currency.title }}" />
	{{ currency.title }} <small>({{ currency.symbol }})</small>
</button>
{% endif %}
{% endfor %}
<div class="dropdown-menu" aria-labelledby="dropdownCurrencies">
	{% for currency in currencies %}
	{% if currency.id != active_id %}
	<a href="{{ currency.url }}" class="dropdown-item">
		<img src="{{ currency.image }}" alt="{{ currency.code }}" title="{{ currency.title }}" />
		{{ currency.title }} <small>({{ currency.symbol }})</small>
	</a>
	{% endif %}
	{% endfor %}
</div>