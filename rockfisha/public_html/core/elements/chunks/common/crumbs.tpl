<div class="col-xs-12 no-padding">
  {$_modx->runSnippet('!pdoCrumbs',[
        'showHome' => 1,
        'tplCurrent' => '@INLINE <li class="breadcrumb-item active">{$menutitle}</li>',
        'tpl' => '@INLINE <li class="breadcrumb-item"><a href="{$link}">{$menutitle}</a></li>'
    ])}
</div>