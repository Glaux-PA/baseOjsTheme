{**
 * templates/frontend/components/navigationMenu.tpl
 *
 * Copyright (c) 2023 GLAUX Publicaciones Académicas.
 *
 *}

{if $navigationMenu}
	<ul id="{$id|escape}" class="{$ulClass|escape} pkp_nav_list">
		{if $id eq "navigationUser"}
			{include file="frontend/components/languageSwitcher.tpl" id="languageLargeNav"}
		{/if}

		{foreach key=field item=navigationMenuItemAssignment from=$navigationMenu->menuTree}
			{if !$navigationMenuItemAssignment->navigationMenuItem->getIsDisplayed()}
				{continue}
			{/if}

			{if $navigationMenuItemAssignment->navigationMenuItem->getUrl()|strpos:"/register" }
				{assign var="extraClass" value=' profile_register'}
			{elseif  $navigationMenuItemAssignment->navigationMenuItem->getUrl()|strpos:"/login"}
				{assign var="extraClass" value=' profile_login'}
			{/if}
			<li
				class="{$liClass|escape}{$extraClass}{if $currentUrl == $navigationMenuItemAssignment->navigationMenuItem->getUrl() } isActive{/if}">
				{if $navigationMenuItemAssignment->children}
					<i class="bi bi-chevron-down"></i>
				{/if}
				{if $navigationMenuItemAssignment->navigationMenuItem->getIsChildVisible()}
					{$navigationMenuItemAssignment->navigationMenuItem->getLocalizedTitle()}
				{else}
					<a href="{$navigationMenuItemAssignment->navigationMenuItem->getUrl()}">
						{$navigationMenuItemAssignment->navigationMenuItem->getLocalizedTitle()}
					</a>
				{/if}
				{if $navigationMenuItemAssignment->navigationMenuItem->getIsChildVisible()}
					<ul class="submenu hidden-element">
						{foreach key=childField item=childNavigationMenuItemAssignment from=$navigationMenuItemAssignment->children}
							{if $childNavigationMenuItemAssignment->navigationMenuItem->getIsDisplayed()}
								<li class="{$liClass|escape}">
									<a href="{$childNavigationMenuItemAssignment->navigationMenuItem->getUrl()}">
										{$childNavigationMenuItemAssignment->navigationMenuItem->getLocalizedTitle()}
									</a>
								</li>
							{/if}
						{/foreach}
					</ul>
				{/if}
			</li>
		{/foreach}
	</ul>
{/if}