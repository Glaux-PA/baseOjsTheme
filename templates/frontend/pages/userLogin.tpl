{**
 * templates/frontend/pages/userLogin.tpl
 *
 * Copyright (c) 2025 GLAUX Publicaciones Académicas.
 *
 * User login form.
 *
 *}
{include file="frontend/components/header.tpl" pageTitle="user.login"}

<div class="page page_login">
	<div class="container">
		{include file="frontend/components/breadcrumbs.tpl" currentTitleKey="user.login"}
	</div>

	<div class="inner_wrapper_bg">
		<div class="container">
			<div class="form_wrapper_G">
				<h1 class="page_title ">{translate key="user.login"}</h1>
	
				<p>
					{translate key="common.requiredField"}
				</p>
				{* A login message may be displayed if the user was redireceted to the
				   login page from another request. Examples include if login is required
				   before dowloading a file. *}
				{if $loginMessage}
					<p>
						{translate key=$loginMessage}
					</p>
				{/if}

				<form class="cmp_form login" id="login" method="post" action="{$loginUrl}" role="form">
					{csrf}

					{if $error}
						<div class="pkp_form_error">
							{translate key=$error reason=$reason}
						</div>
					{/if}

					<input type="hidden" name="source" value="{$source|default:""|escape}" />

					<fieldset class="fields">
						<legend class="pkp_screen_reader">{translate key="user.login"}</legend>
							<div class="username input-group-g">
								<label class="form-label">
									{translate key="user.usernameOrEmail"}
									<span class="required" aria-hidden="true">*</span>
									<span class="pkp_screen_reader">
										{translate key="common.required"}
									</span>
								</label>

								<input class="form-control" type="text" name="username" id="username" value="{$username|default:""|escape}" maxlength="32" required aria-required="true">
							</div>

							<div class="password input-group-g">
								<label class="form-label">
									{translate key="user.password"}
									<span class="required" aria-hidden="true">*</span>
									<span class="pkp_screen_reader">
										{translate key="common.required"}
									</span>
								</label>

								<input class="form-control" type="password" name="password" id="password" value="{$password|default:""|escape}" password="true" maxlength="32" required aria-required="true">
								<a href="{url page="login" op="lostPassword"}">
									{translate key="user.login.forgotPassword"}
								</a>
							</div>
						


							<div class="form-check input-group-g">
								<input class="form-check-input" type="checkbox" name="remember" id="remember" value="1" checked="$remember">

							 	<label class="form-check-label" for="flexCheckDefault">
							 		{translate key="user.login.rememberUsernameAndPassword"}
								</label>
							</div>

							{* recaptcha spam blocker *}
							{if $recaptchaPublicKey}
								<fieldset class="recaptcha_wrapper">
									<div class="fields">
										<div class="recaptcha">
											<div class="g-recaptcha" data-sitekey="{$recaptchaPublicKey|escape}">
											</div><label for="g-recaptcha-response" style="display:none;" hidden>Recaptcha response</label>
										</div>
									</div>
								</fieldset>
							{/if}

						<div class="buttons">
							<button class="submit btn btn-primary" type="submit">
								{translate key="user.login"}
							</button>

							{if !$disableUserReg}
								{capture assign=registerUrl}{url page="user" op="register" source=$source}{/capture}
								<a href="{$registerUrl}" class="btn-link register">
									{translate key="drassanaTheme.user.login.registerNewAccount"}
								</a>
							{/if}
						</div>
					</fieldset>
				</form>
			</div>
		</div>
	</div>
</div><!-- .page -->

{include file="frontend/components/footer.tpl"}
