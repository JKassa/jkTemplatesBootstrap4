{{ 'loadAll5' | fontawesome }}
{% case icon %}
	{% when 'print' %}
		<span class="fas fa-print"></span>
        {{ '_' | jtext: 'JGLOBAL_PRINT' }}
	{% when 'print_screen' %}
		<span class="fas fa-print"></span>
        {{ '_' | jtext: 'JGLOBAL_PRINT' }}
    {% when 'email' %}
		<span class="fas fa-envelope"></span>
        {{ '_' | jtext: 'JGLOBAL_EMAIL' }}
	{% when 'lock' %}
		<span class="fas fa-lock"></span>
        {{ '_' | jtext: 'JLIB_HTML_CHECKED_OUT' }}
    {% when 'close' %}
		<span class="fas fa-eye-close"></span>
        {{ '_' | jtext: 'JGLOBAL_EDIT' }}
    {% when 'edit' %}
		<span class="fas fa-pencil-alt"></span>
        {{ '_' | jtext: 'JGLOBAL_EDIT' }}
    {% when 'create' %}
		<span class="fas fa-plus"></span>
        {{ '_' | jtext: 'JNEW' }}
	{% when 'help' %}
		<span class="hasTooltip" title="{{ tooltip }}">
			<i class="fas fa-info-circle"></i>
		</span>
	{% when 'star' %}
		<span class="fas fa-star" style="color: #F2CD00"></span>
	{% when 'star-empty' %}
		<span class="far fa-star" style="color: #CCCCCC"></span>
	{% when 'big-star' %}
		<span class="fas fa-star" style="color: #F2CD00; font-size: 24px"></span>
	{% when 'big-star-empty' %}
		<span class="far fa-star" style="color: #CCCCCC; font-size: 24px"></span>
	{% when 'status_success' %}
		{% capture url %}jktemplates/{{ '' | templateName }}/images/status_success.png{% endcapture %}
		{{ url }}
	{% when 'status_new' %}
		{% capture url %}jktemplates/{{ '' | templateName }}/images/status_new.png{% endcapture %}
		{{ url }}
	{% when 'status_process' %}
		{% capture url %}jktemplates/{{ '' | templateName }}/images/status_process.png{% endcapture %}
		{{ url }}
	{% when 'status_fail' %}
		{% capture url %}jktemplates/{{ '' | templateName }}/images/status_fail.png{% endcapture %}
		{{ url }}
{% endcase %}