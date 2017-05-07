<!doctype html>
{include 'file:chunks/common/head.tpl'}
<body>
    {block 'header'}
        {include 'file:chunks/common/header.tpl'}
    {/block}
    <div class="row-fluid">
        <div class="container">
    {block 'content'}
        {$_modx->resource.content}  
    {/block}
        </div>
    </div>
    {block 'footer'}
        {include 'file:chunks/common/footer.tpl'}
    {/block}
    {block 'scripts'}
        {include 'file:chunks/common/scripts.tpl'}
    {/block}
</body>
</html>