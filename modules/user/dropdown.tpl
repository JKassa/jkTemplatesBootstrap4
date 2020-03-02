{{ 'stylesheet' | jhtml: 'css/style.css' }}
<div class="jkassa jk-user-module dropdown {{ class_sfx }}">
	<a href="#" style="display: block; position: relative; width: 30px; height: 30px; margin-right: -5px;" id="jk-user-module-dropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
		<span style="display: block; margin-top: 5px">
			<i class="fas fa-user fa-2x"></i>
		</span>
	</a>
	<div class="dropdown-menu dropdown-menu-right" aria-labelledby="jk-user-module-dropdown">
		{% if add_links %}
		<!--Additional links-->
		{% for link in add_links %}
        <a href="{{ link.url }}" class="dropdown-item">
            {{ link.text }}
        </a>
		{% endfor %}
		{% endif %}
		{% if login_url or logout_url %}
		<div class="dropdown-divider"></div>
		{% endif %}
		{% if login_url %}
		<!--Login url-->
        <a href="{{ login_url }}" class="dropdown-item">
            {{ '_' | jtext: 'JACTION_LOGIN_SITE' }}
        </a>
		{% endif %}
		{% if logout_url %}
		<!--Logout url-->
        <a href="{{ logout_url }}" class="dropdown-item">
            {{ '_' | jtext: 'JLOGOUT' }}
        </a>
		{% endif %}
	</div>
</div>