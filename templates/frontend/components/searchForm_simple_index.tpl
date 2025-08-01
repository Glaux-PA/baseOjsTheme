{**
 * templates/frontend/components/searchForm_simple.tpl
 *
 * Copyright (c) 2023 GLAUX Publicaciones Académicas.
 *
 *}

{if !$currentJournal || $currentJournal->getData('publishingMode') != $smarty.const.PUBLISHING_MODE_NONE}
	{capture name="searchFormUrl"}{url page="search" op="search" escape=false}{/capture}
	{assign var=formUrlParameters value=[]}{* Prevent Smarty warning *}
	{$smarty.capture.searchFormUrl|parse_url:$smarty.const.PHP_URL_QUERY|parse_str:$formUrlParameters}
	<form class="pkp_search" action="{$smarty.capture.searchFormUrl|strtok:"?"|escape}" method="get" role="search" aria-label="{translate|escape key="submission.search"}">
		{foreach from=$formUrlParameters key=paramKey item=paramValue}
			<input type="hidden" name="{$paramKey|escape}" value="{$paramValue|escape}"/>
		{/foreach}
		{block name=searchQuerySimple}
			<input class="form-control" name="query" value="{$searchQuery|escape}" type="search" aria-label="{translate|escape key="common.searchQuery"}" placeholder="">
			<span class="bi bi-search"></span>
		{/block}
	</form>
{/if}