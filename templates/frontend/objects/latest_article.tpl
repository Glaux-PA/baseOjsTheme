<div class="sections latest_articles">
    <{$heading} class="highlight_first">
        {translate key="submissions.published.latest"}
    </{$heading}>

    <div class="articles-list-row">
        {foreach from=$articles item=article}
            <div class="article-wrapper">
                {include file="frontend/objects/article_summary.tpl" heading=$articleHeading}
            </div>
        {/foreach}
    </div>
</div>