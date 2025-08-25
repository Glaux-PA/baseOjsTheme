{**
 * templates/frontend/components/registrationForm.tpl
 *
 * Copyright (c) 2025 GLAUX Publicaciones Académicas.
 *
 * @brief Display the basic registration form fields
 *
 * @uses $locale string Locale key to use in the affiliate field
 * @uses $givenName string First name input entry if available
 * @uses $familyName string Last name input entry if available
 * @uses $countries array List of country options
 * @uses $country string The selected country if available
 * @uses $email string Email input entry if available
 * @uses $username string Username input entry if available
 *}
<fieldset class="identity">
	<legend>
		{translate key="user.profile"}
	</legend>
	<div class="fields">
		<div class="given_name input-group-g">
			<label class="form-label">
				<span class="label">
					{translate key="user.givenName"}
					<span class="required" aria-hidden="true">*</span>
					<span class="pkp_screen_reader">
						{translate key="common.required"}
					</span>
				</span>
			</label>
			<input class="form-control" type="text" name="givenName" autocomplete="given-name" id="givenName" value="{$givenName|default:""|escape}" maxlength="255" required aria-required="true">
		</div>

		<div class="family_name input-group-g">
			<label class="form-label">
				<span class="label">
					{translate key="user.familyName"}
				</span>
			</label>
			<input class="form-control" type="text" name="familyName" autocomplete="family-name" id="familyName" value="{$familyName|default:""|escape}" maxlength="255">
		</div>
		
		<div class="affiliation input-group-g">
			<label class="form-label">
				<span class="label">
					{translate key="user.affiliation"}
					<span class="required" aria-hidden="true">*</span>
					<span class="pkp_screen_reader">
						{translate key="common.required"}
					</span>
				</span>
			</label>
			<input class="form-control" type="text" name="affiliation" id="affiliation" value="{$affiliation|default:""|escape}" required aria-required="true">
		</div>
		
		<div class="country input-group-g">
			<label class="form-label">
				<span class="label">
					{translate key="common.country"}
					<span class="required" aria-hidden="true">*</span>
					<span class="pkp_screen_reader">
						{translate key="common.required"}
					</span>
				</span>
				<select class="form-select" name="country" id="country" required aria-required="true">
					<option></option>
					{html_options options=$countries selected=$country}
				</select>
			</label>
		</div>
	</div>
</fieldset>

<fieldset class="login">
	<legend>
		{translate key="user.login"}
	</legend>
	
	<div class="fields">
		<div class="email input-group-g">
			<label class="form-label">
				<span class="label">
					{translate key="user.email"}
					<span class="required" aria-hidden="true">*</span>
					<span class="pkp_screen_reader">
						{translate key="common.required"}
					</span>
				</span>
			</label>
			<input class="form-control" type="email" name="email" id="email" value="{$email|default:""|escape}" maxlength="90" required aria-required="true" autocomplete="email">
		</div>
		
		<div class="username input-group-g">
			<label class="form-label">
				<span class="label">
					{translate key="user.username"}
					<span class="required" aria-hidden="true">*</span>
					<span class="pkp_screen_reader">
						{translate key="common.required"}
					</span>
				</span>
			</label>
			<input class="form-control" type="text" name="username" id="username" value="{$username|default:""|escape}" maxlength="32" required aria-required="true" autocomplete="username">
		</div>

		<div class="password input-group-g">
			<label class="form-label">
				<span class="label">
					{translate key="user.password"}
					<span class="required" aria-hidden="true">*</span>
					<span class="pkp_screen_reader">
						{translate key="common.required"}
					</span>
				</span>
			</label>
			<input class="form-control" type="password" name="password" id="password" password="true" maxlength="32" required aria-required="true">
		</div>

		<div class="password input-group-g">
			<label class="form-label">
				<span class="label">
					{translate key="user.repeatPassword"}
					<span class="required" aria-hidden="true">*</span>
					<span class="pkp_screen_reader">
						{translate key="common.required"}
					</span>
				</span>
			</label>
			<input class="form-control" type="password" name="password2" id="password2" password="true" maxlength="32" required aria-required="true">
		</div>
	</div>
</fieldset>
