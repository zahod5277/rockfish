<!doctype html>
{extends 'file:templates/base.tpl'}
{block 'content'}
    <div id="wrapper" class="col-xs-12 col-lg-11 offset-lg-1 no-padding">
        <div class="col-xs-12">
            {include 'file:chunks/common/crumbs.tpl'}
        </div>
        <div class="col-xs-12 col-lg-12">
            <h1 id="title">Все концерты площадки {$_modx->resource.pagetitle}</h1>
        </div>
        {*    <div class="col-xs-12 col-lg-3 offset-lg-6">
        <a href="/">По дате</a>
        <a href="/*">По клубам</a>
        </div>*}
        <div class="col-xs-12" id="events-outer">
            {$_modx->runSnippet('!pdoArchive',[
            'parents' => $_modx->resource.id,
            'dateField' => 'publishedon',
            'sortby' => 'publishedon',
            'sortdir' => 'ASC',
            'includeTVs' => 'club,img,price',
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
        </div>
    </div>
{/block}