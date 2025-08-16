{**
 * templates/frontend/pages/indexJournal.tpl
 *
 * Copyright (c) 2014-2021 Simon Fraser University
 * Copyright (c) 2003-2021 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * @brief Display the index page for a journal
 *
 * @uses $currentJournal Journal This journal
 * @uses $journalDescription string Journal description from HTML text editor
 * @uses $homepageImage object Image to be displayed on the homepage
 * @uses $additionalHomeContent string Arbitrary input from HTML text editor
 * @uses $announcements array List of announcements
 * @uses $numAnnouncementsHomepage int Number of announcements to display on the
 *       homepage
 * @uses $issue Issue Current issue
 *}
{include file="frontend/components/header.tpl" pageTitleTranslated=$currentJournal->getLocalizedName()}

<div class="page_index_journal">
	<div class="container">
		<div class="row">
			<div class="col-md-6">
				{* Revisar qué es este hook *}
				{call_hook name="Templates::Index::journal"}

				{* Revisar si mantenemos Journal Description aquí o solo en About 
				{if $activeTheme && $activeTheme->getOption('showDescriptionInJournalIndex')}
					<section class="homepage_about">
						<a id="homepageAbout"></a>
						<h2>{translate key="about.aboutContext"}</h2>
						{$currentContext->getLocalizedData('description')}
					</section>
				{/if}
				*}

				{* Additional Homepage Content *}
				{if $additionalHomeContent}
					<div class="additional_content">
						{$additionalHomeContent}
					</div>
				{/if}

				<div class="btn-group">
					 <a class="btn btn-primary"
                        href="{url router=$smarty.const.ROUTE_PAGE page="about"}">{translate key="btn.saberMas"}</a>
				</div>
			</div>

			<div class="col-md-6">
				{* revisar --este código es provisional porque homepage_image da un error-- *}
				<a href="{$homeUrl}" class="is_img">
					<img src="{$baseUrl}/plugins/themes/baseOjsTheme/img/home-img.jpg" alt="portada">
        		</a>

				{if $activeTheme && !$activeTheme->getOption('useHomepageImageAsHeader') && $homepageImage}
					<div class="homepage_image">
						<img src="{$publicFilesDir}/{$homepageImage.uploadName|escape:"url"}"{if $homepageImage.altText} alt="{$homepageImage.altText|escape}"{/if}>
					</div>
				{/if}
			</div>
		</div>
	</div>

	<div class="container">
		<div class="row">
			<div class="col-md-9">

				{* Latest issue *}
				{if $issue}
					<section class="current_issue">
						<a id="homepageIssue"></a>
						<h2>
							{translate key="journal.currentIssue"}
						</h2>
						<div class="current_issue_title">
							{$issue->getIssueIdentification()|strip_unsafe_html}
						</div>
						{include file="frontend/objects/issue_toc.tpl" heading="h3"}
						<a href="{url router=\PKP\core\PKPApplication::ROUTE_PAGE page="issue" op="archive"}" class="read_more">
							{translate key="journal.viewAllIssues"}
						</a>
					</section>
				{/if}

				{include file="frontend/objects/announcements_list.tpl" numAnnouncements=$numAnnouncementsHomepage}
			</div>

			<div class="col-md-3">
				{* Sidebars *}
				{if empty($isFullWidth)}
					{capture assign="sidebarCode"}{call_hook name="Templates::Common::Sidebar"}{/capture}
					{if $sidebarCode}
						<div class="pkp_structure_sidebar left" role="complementary">
							{$sidebarCode}
						</div><!-- pkp_sidebar.left -->
					{/if}
				{/if}
			</div>
		</div>
	</div>
</div><!-- .page -->

{include file="frontend/components/footer.tpl"}
