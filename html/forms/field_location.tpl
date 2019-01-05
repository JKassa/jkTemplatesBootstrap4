<fieldset id="jk_location" class="form-group"{% if field.showon %} data-showon='{{ field.showon }}'{% endif %}>
	<div class="row">
		<legend class="col-form-label col-sm-4">
			{{ field.label }}{% if field.required %} <span class="text-danger">*</span>{% endif %}
		</legend>
		<div id="{{ field.name }}" class="col-sm-8">
			<div class="" id="locations_countries_wrapper">
				<label for="locations_countries" style="display:none">{{ '_' | jtext: 'COM_JKASSA_COUNTRY' }}</label>
				<select name="locations_countries" id="locations_countries" class="custom-select"{% if field.required %} required{% endif %}>
					<option value="">{{ '_' | jtext: 'COM_JKASSA_COUNTRY_SELECT' }}</option>
				</select>
			</div>
			<div class="mt-1" id="locations_regions_wrapper">
				<label for="locations_regions" style="display:none">{{ '_' | jtext: 'COM_JKASSA_STATE' }}</label>
				<select name="locations_regions" id="locations_regions" class="custom-select"{% if field.required %} required{% endif %}>
					<option value="">{{ '_' | jtext: 'COM_JKASSA_STATE_SELECT' }}</option>
				</select>
			</div>
			<div class="mt-1" id="locations_cities_wrapper">
				<label for="locations_cities" style="display:none">{{ '_' | jtext: 'COM_JKASSA_CITY' }}</label>
				<select name="locations_cities" id="locations_cities" class="custom-select"{% if field.required %} required{% endif %}>
					<option value="">{{ '_' | jtext: 'COM_JKASSA_CITY_SELECT' }}</option>
				</select>
			</div>
		</div>
	</div>
</fieldset>