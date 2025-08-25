{**
 * templates/frontend/components/share_buttons.tpl
 *
 * Copyright (c) 2023 GLAUX Publicaciones Académicas.
 *
 *}

<div class="share_block">
    <ul class="share-list">
        <li class="share-twitter"><a target="_blank" href="https://twitter.com/intent/tweet?text={$pageTitleTranslated}&url={$currentUrl|escape}"><i class="bi bi-twitter-x"></i></a></li>
        <li class="share-linkedin"><a target="_blank" href="https://www.linkedin.com/shareArticle?mini=true&summary=&title={$pageTitleTranslated}&url={$currentUrl|escape}"><i class="bi bi-linkedin"></i></a></li>
        <li class="share-facebook"><a target="_blank" href="https://www.facebook.com/sharer/sharer.php?u={$currentUrl|escape}"><i class="bi bi-facebook"></i></a></li>
        <li class="share-whatsapp"><a target="_blank" href="whatsapp://send?text={$pageTitleTranslated} {$currentUrl|escape}"><i class="bi bi-whatsapp"></i></a></li>
        <li class="share-email"><a target="_blank" href="mailto:?subject={$pageTitleTranslated}&body={$currentUrl|escape}"><i class="bi bi-envelope"></i></a></li>
    </ul>
</div>


