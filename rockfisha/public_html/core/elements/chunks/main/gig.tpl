<div class="event col-xs-12 col-sm-6 col-md-6 col-lg-12">
    <div class="col-xs-12 col-lg-3 no-padding">
        {if $_pls['tv.img']!=''}
            {var $img = $_pls['tv.img']}
        {else}
            {var $img = 'assets/images/template/no-avatar.jpg'}
        {/if}
        <img src="{$img}" alt="{$pagetitle}" class="img-rounded img-fluid">
    </div>
    <div class="col-xs-12 col-lg-8 offset-lg-1 event-info">
        <h3>
            <a href="{$id|url}" title="{$pagetitle}">
                {$pagetitle}
            </a>
        </h3>
        <h6 class="gig-genre">{$_pls['tv.genre']}</h6>
        <p>Где: <strong><a href="{$_modx->makeUrl($id|resource:"parent")}" title="концерт {$pagetitle} в спб">{$_pls['tv.club']}</a></strong></p>
        <p>Когда: <strong>{$publishedon|date_format:"%d/%m/%Y"}</strong></p>
        <p>Сколько: <strong>{$_pls['tv.price']}</strong></p>
    </div>
</div>