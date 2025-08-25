{**
 * templates/frontend/objects/issue_toc.tpl
 *
 * Copyright (c) 2014-2021 Simon Fraser University
 * Copyright (c) 2003-2021 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * @brief View of an Issue which displays a full table of contents.
 *
 * @uses $issue Issue The issue
 * @uses $issueTitle string Title of the issue. May be empty
 * @uses $issueSeries string Vol/No/Year string for the issue
 * @uses $issueGalleys array Galleys for the entire issue
 * @uses $hasAccess bool Can this user access galleys for this context?
 * @uses $publishedSubmissions array Lists of articles published in this issue
 *   sorted by section.
 * @uses $primaryGenreIds array List of file genre ids for primary file types
 * @uses $heading string HTML heading element, default: h2
 *}
{if !$heading}
	{assign var="heading" value="h2"}
{/if}
{assign var="articleHeading" value="h3"}
{if $heading == "h3"}
	{assign var="articleHeading" value="h4"}
{elseif $heading == "h4"}
	{assign var="articleHeading" value="h5"}
{elseif $heading == "h5"}
	{assign var="articleHeading" value="h6"}
{/if}
<div class="obj_issue_toc">

	{* Indicate if this is only a preview *}
	{if !$issue->getPublished()}
		{include file="frontend/components/notification.tpl" type="warning" messageKey="editor.issues.preview"}
	{/if}

	{* Issue introduction area above articles *}
	<div class="heading">
		{* Share Buttons*}
    	{include file="frontend/components/share_buttons.tpl"}

		<div class="row">
			<div class="col-md-4"> 
				{* Issue cover image *}
				{assign var=issueCover value=$issue->getLocalizedCoverImageUrl()}
				{if $issueCover}
					<div class="cover">
						{capture assign="defaultAltText"}
							{translate key="issue.viewIssueIdentification" identification=$issue->getIssueIdentification()|escape}
						{/capture}
						<img src="{$issueCover|escape}" alt="{$issue->getLocalizedCoverImageAltText()|escape|default:$defaultAltText}">
					</div>
				{/if}
			</div>

			<div class="col-md-8"> 
				{* Revisar para mostrar el campo Description acortado *}
				<div class="description">
					<p>En este número de 2025 continuamos nuestro compromiso con la exploración de los retos y oportunidades que las tecnologías emergentes presentan en el campo de la comunicación. Este número marca el inicio de nuestra periodicidad anual que publica de manera permanente y abierta durante todo el año para la recepción de artículos con la finalidad de fomentar un flujo constante de investigaciones innovadoras que aborden los desafíos actuales de la comunicación.</p>
				</div>

				{* Revisar si se incluye este campo de Description (puede ser acortado) 
				{if $issue->hasDescription()}
					<div class="description">
						{$issue->getLocalizedDescription()|strip_unsafe_html}
					</div>
				{/if}
				*}

				{* PUb IDs (eg - URN) *}
				{foreach from=$pubIdPlugins item=pubIdPlugin}
					{assign var=pubId value=$issue->getStoredPubId($pubIdPlugin->getPubIdType())}
					{if $pubId}
						{assign var="resolvingUrl" value=$pubIdPlugin->getResolvingURL($currentJournal->getId(), $pubId)|escape}
						<div class="pub_id {$pubIdPlugin->getPubIdType()|escape}">
							<span class="type">
								{$pubIdPlugin->getPubIdDisplayType()|escape}:
							</span>
							<span class="id">
								{if $resolvingUrl}
									<a href="{$resolvingUrl|escape}">
										{$resolvingUrl}
									</a>
								{else}
									{$pubId}
								{/if}
							</span>
						</div>
					{/if}
				{/foreach}

				{* DOI *}
				{assign var=doiObject value=$issue->getData('doiObject')}
				{if $doiObject}
					{assign var="doiUrl" value=$doiObject->getData('resolvingUrl')|escape}
					<div class="pub_id doi">
						<span class="type">
							DOI:
						</span>
						<span class="id">
							<a href="{$doiUrl|escape}">
								{$doiUrl}
							</a>
						</span>
					</div>
				{/if}

				{* Published date *}
				{if $issue->getDatePublished()}
					<div class="published">
						<span class="label">
							{translate key="submissions.published"}:
						</span>
						<span class="value">
							{$issue->getDatePublished()|date_format:$dateFormatShort}
						</span>
					</div>
				{/if}

				{* Full-issue galleys *}
				{if $issueGalleys}
					<div class="galleys">
						<{$heading} id="issueTocGalleyLabel">
							{translate key="issue.fullIssue"}
						</{$heading}>
						<ul class="galleys_links">
							{foreach from=$issueGalleys item=galley}
								<li>
									{include file="frontend/objects/galley_link.tpl" parent=$issue labelledBy="issueTocGalleyLabel" purchaseFee=$currentJournal->getData('purchaseIssueFee') purchaseCurrency=$currentJournal->getData('currency')}
								</li>
							{/foreach}
						</ul>
					</div>
				{/if}
			</div>
		</div>
	</div>



	{* Articles *}
	<div class="sections">
	{foreach name=sections from=$publishedSubmissions item=section}
		<div class="section">
		{if $section.articles}
			{if $section.title}
				<{$heading}>
					{$section.title|escape}
				</{$heading}>
			{/if}
			<div class="articles-list-row">
				{foreach from=$section.articles item=article}
					<div class="article-wrapper">
						{include file="frontend/objects/article_summary.tpl" heading=$articleHeading}
					</div>
				{/foreach}
			</div>
		{/if}
		</div>
	{/foreach}
	</div><!-- .sections -->
</div>