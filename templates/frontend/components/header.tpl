{**
 * lib/pkp/templates/frontend/components/header.tpl
 *
 * Copyright (c) 2014-2021 Simon Fraser University
 * Copyright (c) 2003-2021 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * @brief Common frontend site header.
 *
 * @uses $isFullWidth bool Should this page be displayed without sidebars? This
 *       represents a page-level override, and doesn't indicate whether or not
 *       sidebars have been configured for thesite.
 *}
{strip}
	{* Determine whether a logo or title string is being displayed *}
	{assign var="showingLogo" value=true}
	{if !$displayPageHeaderLogo}
		{assign var="showingLogo" value=false}
	{/if}
{/strip}
<!DOCTYPE html>
<html lang="{$currentLocale|replace:"_":"-"}" xml:lang="{$currentLocale|replace:"_":"-"}">
{if !$pageTitleTranslated}{capture assign="pageTitleTranslated"}{translate key=$pageTitle}{/capture}{/if}
{include file="frontend/components/headerHead.tpl"}
<body class="pkp_page_{$requestedPage|escape|default:"index"} pkp_op_{$requestedOp|escape|default:"index"}{if $showingLogo} has_site_logo{/if}" dir="{$currentLocaleLangDir|escape|default:"ltr"}">

	<div class="pkp_structure_page">
		{* Header *}
		<header class="pkp_structure_head is-mobile" id="headerNavigationContainer" role="banner">
			{* Skip to content nav links *}
			{include file="frontend/components/skipLinks.tpl"}

			<div class="pkp_head_wrapper">
				<div class="container">
					<div class="row head-innerwrapper">
						<div class="col-10">
							<div class="pkp_site_name_wrapper">
								{if !$requestedPage || $requestedPage === 'index'}
								<h1 class="pkp_screen_reader">
									{if $currentContext}
										{$displayPageHeaderTitle|escape}
									{else}
										{$siteTitle|escape}
									{/if}
								</h1>
								{/if}
								<div class="pkp_site_name">
									{capture assign="homeUrl"}
										{url page="index" router=\PKP\core\PKPApplication::ROUTE_PAGE}
									{/capture}
									

									<a href="{$homeUrl}" class="is_img">
						                <img class="logo" src="{$baseUrl}/{$activeThemePath}/img/logo.svg">
						            </div>

									{* revisar este código para cargar bien el logo
									{if $displayPageHeaderLogo}
										<a href="{$homeUrl}" class="is_img">
											<img src="{$publicFilesDir}/{$displayPageHeaderLogo.uploadName|escape:"url"}" width="{$displayPageHeaderLogo.width|escape}" height="{$displayPageHeaderLogo.height|escape}" {if $displayPageHeaderLogo.altText != ''}alt="{$displayPageHeaderLogo.altText|escape}"{/if} />
										</a>
									{elseif $displayPageHeaderTitle}
										<a href="{$homeUrl}" class="is_text">{$displayPageHeaderTitle|escape}</a>
									{else}
										<a href="{$homeUrl}" class="is_img">
											<img src="{$baseUrl}/templates/images/structure/logo.png" alt="{$applicationName|escape}" title="{$applicationName|escape}" width="180" height="90" />
										</a>
									{/if}
									*}
								</div>
							</div>
						</div>
	                    <div class="col-2">
							<div class="pkp_site_nav_toggle">
	                            <a class="btn-menu" href="#"><i class="bi bi-list"></i></a>
	                        </div>
                    	</div>
					</div>
				</div>

				<div class="pkp_head_wrapper overlay-menu-wrapper hidden-element">
                    <div class="container">
                        <div class="row head_innerwrapper_G">
                            <div class="col-10 site_name_wrapper">
								<div class="pkp_site_name">

									{capture assign="homeUrl"}
										{url page="index" router=\PKP\core\PKPApplication::ROUTE_PAGE}
									{/capture}
									

									<a href="{$homeUrl}" class="is_img">
						                <img class="logo" src="{$baseUrl}/{$activeThemePath}/img/logo.svg">
						            </div>

									{* revisar este código para cargar bien el logo
									{if $displayPageHeaderLogo}
										<a href="{$homeUrl}" class="is_img">
											<img src="{$publicFilesDir}/{$displayPageHeaderLogo.uploadName|escape:"url"}" width="{$displayPageHeaderLogo.width|escape}" height="{$displayPageHeaderLogo.height|escape}" {if $displayPageHeaderLogo.altText != ''}alt="{$displayPageHeaderLogo.altText|escape}"{/if} />
										</a>
									{elseif $displayPageHeaderTitle}
										<a href="{$homeUrl}" class="is_text">{$displayPageHeaderTitle|escape}</a>
									{else}
										<a href="{$homeUrl}" class="is_img">
											<img src="{$baseUrl}/templates/images/structure/logo.png" alt="{$applicationName|escape}" title="{$applicationName|escape}" width="180" height="90" />
										</a>
									{/if}
									*}
								</div>
                            </div>

                           <div class="col-2">
								<div class="pkp_site_nav_toggle">
		                            <a class="btn-menu" href="#"><i class="bi bi-list"></i></a>
		                        </div>
	                    	</div>
                        </div>

                        <div class="row">
                            <div class="col-12">
                                {* User menu *}
                                <div class="pkp_navigation_user_wrapper" id="navigationUserWrapper">
                                    {load_menu name="user" id="navigationUser" ulClass="pkp_navigation_user" liClass="profile"}
                                </div>

                                {* Search form *}
                                <div class="pkp_navigation_search_wrapper">
                                    <div id="search"><a name="search-form"></a>
                                       {include file="frontend/components/searchForm_simple_index.tpl"}
                                    </div>
                                </div>

                                {capture assign="primaryMenu"}
									{load_menu name="primary" id="navigationPrimary" ulClass="pkp_navigation_primary"}
								{/capture}

                                {* Primary navigation menu *}
                                <nav class="pkp_site_nav_menu" aria-label="{translate|escape key="common.navigation.site"}">
                                    <div class="pkp_navigation_primary_row">
                                        <div class="pkp_navigation_primary_wrapper">
                                            {$primaryMenu}
                                        </div>    
                                    </div>
                                </nav>
                            </div>
                        </div>
                    </div>
                </div>
			</div><!-- .pkp_head_wrapper -->
		</header><!-- .pkp_structure_head -->


		<header class="pkp_structure_head is-desktop" id="headerNavigationContainer" role="banner">    
            {* Menu Desktop *}
            <div class="pkp_head_wrapper">
                <div class="container">
                    <div class="head_innerwrapper">
                        <div class="menu-group-wrapper">
                            {* Search form *}
                            <div class="pkp_navigation_search_wrapper">
                                <a href="{url page="search"}" class="pkp_search pkp_search_desktop">
                                    <i class="bi bi-search" aria-hidden="true"></i>
                                    <span class="visually-hidden">{translate key="common.search"}</span>
                                </a>
                            </div>

                            {* User menu *}
                            <div class="pkp_navigation_user_wrapper" id="navigationUserWrapper">
                                {load_menu name="user" id="navigationUser" ulClass="pkp_navigation_user" liClass="profile"}
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="row">
                    <div class="col-md-4 site_name_wrapper_G">
                        {* Logo *}
                        <div class="pkp_site_name">
                            <a href="{$homeUrl}"><img class="logo" src="{$publicFilesDir}/{$displayPageHeaderLogo.uploadName|escape:"url"}" {if $displayPageHeaderLogo.altText != ''}alt="{$displayPageHeaderLogo.altText|escape}"{/if} /></a>
                        </div>
                    </div>

                    <div class="col-md-8">
                         {capture assign="primaryMenu"}
							{load_menu name="primary" id="navigationPrimary" ulClass="pkp_navigation_primary"}
						{/capture}

                        {* Primary navigation menu *}
                        <nav class="pkp_site_nav_menu" aria-label="{translate|escape key="common.navigation.site"}">
                            <div class="pkp_navigation_primary_row">
                                <div class="pkp_navigation_primary_wrapper">
                                    {$primaryMenu}
                                </div>    
                            </div>
                        </nav>
                    </div>
                </div>
            </div>
        </header>
        {* Fin Menu Desktop *}

		

		{* Wrapper for page content and sidebars *}
		{if $isFullWidth}
			{assign var=hasSidebar value=0}
		{/if}
		<div class="pkp_structure_content{if $hasSidebar} has_sidebar{/if}">
			<div class="pkp_structure_main" role="main">
				<a id="pkp_content_main"></a>
