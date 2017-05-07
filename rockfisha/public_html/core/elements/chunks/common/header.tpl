<header>
    <div id="gray-head" class="row-fluid">
        <div class="container">
            <div class="col-xs-12 col-lg-10 offset-lg-2">
                <p>Все рок-концерты СПб</p>
            </div>
        </div>
    </div>
    <div id="red-head" class="row-fluid">
        <div class="container">
            <div class="col-xs-12 col-md-4 col-lg-1 offset-lg-1" id="logoOuter">
                {if $_modx->resource.id=='1'}
                    <img src="{$_modx->config.assets_url}images/template/logo.png" alt="Рок концерты в Спб. Афиша концертов СПб" id="logo">
                    {else}
                    <a href="{$_modx->makeUrl(1)}" title="на главную">
                        <img src="{$_modx->config.assets_url}images/template/logo.png" alt="Рок концерты в Спб. Афиша концертов СПб" id="logo">
                    </a>
                {/if}
                
            </div>
            <div class="col-xs-12 col-md-12 col-lg-7 offset-lg-1 no-padding">
                <ul id="menu">
                    <li>
                        <a href="{'1'|url}" title="Рок-концерты СПб">Концерты</a>
                    </li>
                    <li>
                        <a href="{'3'|url}" title="Рок-клубы Санкт-Петербурга">Клубы</a>
                    </li>
                    <li>
                        <a href="{'58'|url}" title="О проекте Rockfisha">О проекте</a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</header>