<!doctype html>
{extends 'file:templates/base.tpl'}
{block 'content'}
    <div id="wrapper" class="col-xs-12 col-lg-11 offset-lg-1 no-padding">
        <div class="col-xs-12">
            {include 'file:chunks/common/crumbs.tpl'}
        </div>
        <div class="col-xs-12 col-lg-12">
            <h1 id="title">{$_modx->resource.longtitle}</h1>
        </div>
        {*    <div class="col-xs-12 col-lg-3 offset-lg-6">
        <a href="/">По дате</a>
        <a href="/*">По клубам</a>
        </div>*}
        <div class="col-xs-12" id="events-outer">
            {$_modx->runSnippet('!pdoMenu',[
            'parents' => $_modx->resource.id,
            'level' => 1,
            'includeTVs' => 'img',
            'prepareTVs' => 1,
            'processTVs' => 1,
            'tplOuter' => '@INLINE {$wrapper}',
            'tpl' => '@FILE:chunks/category/category.row.tpl'
        ])}
        {$_modx->resource.content}
        </div>
    </div>
{/block}