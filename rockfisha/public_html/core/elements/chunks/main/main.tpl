<div id="wrapper" class="col-xs-12 col-lg-11 offset-lg-1 no-padding">
    <div class="col-xs-12 col-lg-12">
        {if $_modx->resource.longtitle!=''}
            {var $title = $_modx->resource.longtitle}
        {else}
            {var $title = $_modx->resource.pagetitle}    
        {/if}
        <p id="title">{$title}</p>
    </div>
    {*    <div class="col-xs-12 col-lg-3 offset-lg-6">
    <a href="/">По дате</a>
    <a href="/*">По клубам</a>
    </div>*}
    <div id="pdopage">
        <div class="col-xs-12 rows" id="events-outer">
            {$_modx->runSnippet('!pdoPage',[
            'element' => 'pdoArchive',
            'limit' => 30,
            'parents' => 3,
            'ajax' => 1,
            'ajaxMode' => 'button',
            'dateField' => 'publishedon',
            'sortby' => 'publishedon',
            'sortdir' => 'ASC',
            'includeTVs' => 'club,img,price,genre',
            'prepareTVs' => 1,
            'processTVs' => 1,
            'tplYear' => '@INLINE <div class="col-xs-12 heading-line">
                            <h2>{$year}</h2>
                            </div>
                            {$wrapper}',
            'tplMonth' => '@INLINE <div class="col-xs-12 heading-line pinned">
                            <h2>{$month_name}</h2>
                           </div>
                           {$wrapper}',
            'tplDay' => '@INLINE {$wrapper}',
            'tplWrapper' => '@INLINE {$output}',
            'tpl' => '@FILE:chunks/main/gig.tpl',
            'where' => '{"template:=":"4"}'
        ])}
            {$_modx->getPlaceholder('page.nav')}
        </div>
    </div>
</div>