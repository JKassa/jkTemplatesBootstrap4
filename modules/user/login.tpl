<form action="{{ form_action }}" method="post">
	<!--User name-->
	<div class="form-group">
		<div class="input-group">
			<div class="input-group-prepend">
				<span class="input-group-text hasTooltip" title="{{ '_' | jtext: 'JGLOBAL_USERNAME' }}">
					<i class="fas fa-user"></i>
				</span>
				<label for="modjku-username" class="sr-only">{{ '_' | jtext: 'JGLOBAL_USERNAME' }}</label>
			</div>
			<input id="modjku-username" type="text" name="username" class="form-control" tabindex="0" size="18" placeholder="{{ '_' | jtext: 'JGLOBAL_USERNAME' }}" />
		</div>
	</div>
	<!--Password-->
	<div class="form-group">
		<div class="input-group">
			<div class="input-group-prepend">
				<span class="input-group-text hasTooltip" title="{{ '_' | jtext: 'JGLOBAL_PASSWORD' }}">
					<i class="fas fa-lock"></i>
				</span>
				<label for="modjku-passwd" class="sr-only">{{ '_' | jtext: 'JGLOBAL_PASSWORD' }}</label>
			</div>
			<input id="modjku-passwd" type="password" name="password" class="form-control" tabindex="0" size="18" placeholder="{{ '_' | jtext: 'JGLOBAL_PASSWORD' }}" />
		</div>
	</div>
	{% if twoFactorMethods %}
	<!--Secret key-->
	<div class="form-group">
		<div class="input-group">
			<div class="input-group-prepend">
				<span class="input-group-text hasTooltip" title="{{ '_' | jtext: 'JGLOBAL_SECRETKEY' }}">
					<i class="fas fa-star"></i>
				</span>
				<label for="modjku-secretkey" class="sr-only">{{ '_' | jtext: 'JGLOBAL_SECRETKEY' }}</label>
			</div>
			<input id="modjku-secretkey" autocomplete="off" type="text" name="secretkey" class="form-control" tabindex="0" size="18" placeholder="{{ '_' | jtext: 'JGLOBAL_SECRETKEY' }}" />
			<div class="input-group-append">
				<span class="input-group-text hasTooltip" title="{{ '_' | jtext: 'JGLOBAL_SECRETKEY_HELP' }}">
					<i class="fas fa-info-circle"></i>
				</span>
			</div>
		</div>
	</div>
	{% endif %}
	{% if remember %}
	<!--Remember-->
	<div class="checkbox">
		<label>
			<input id="modjku-remember" type="checkbox" name="remember" class="inputbox" value="yes" />
			{{ '_' | jtext: 'JGLOBAL_REMEMBER_ME' }}
		</label>
	</div>
	{% endif %}
	<!--Submit-->
	<button type="submit" tabindex="0" name="Submit" class="btn btn-primary login-button">
		{{ '_' | jtext: 'JLOGIN' }}
	</button>
	<input type="hidden" name="option" value="com_users" />
	<input type="hidden" name="task" value="user.login" />
	<input type="hidden" name="return" value="{{ return }}" />
	{{ token }}
</form>