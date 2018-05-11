<dl class="row">
	{% if user_name %}
	<dt class="col-sm-3">{{ '_' | jtext: 'COM_JKASSA_DATA_BUYER_NAME' }}:</dt>
	<dd class="col-sm-9">{{ user_name }}</dd>
	{% endif %}
	{% if user_email %}
	<dt class="col-sm-3">{{ '_' | jtext: 'JGLOBAL_EMAIL' }}:</dt>
	<dd class="col-sm-9">{{ user_email }}</dd>
	{% endif %}
	{% if user_data %}
	{% for user in user_data %}
	<dt class="col-sm-3">{{ user.name }}</dt>
	<dd class="col-sm-9">{{ user.value }}</dd>
	{% endfor %}
	{% endif %}
	{% if custom_fields %}
	{% for field in custom_fields %}
	<dt class="col-sm-3">{{ field.name }}</dt>
	<dd class="col-sm-9">{{ field.value }}</dd>
	{% endfor %}
	{% endif %}
</dl>