<!doctype html>
<head>
    <title>{$_modx->resource.pagetitle}</title>
    <base href="{$_modx->config.site_url}">
    <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.4/css/bootstrap.min.css" integrity="sha384-2hfp1SzUoho7/TsGGGDaFdsuuDL0LX2hnUp6VkX3CUQ2K4K+xjboZdsXyp4oUHZj" crossorigin="anonymous">
    <link rel="stylesheet" href="{$_modx->config.assets_url}default/fa/css/font-awesome.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.4/js/bootstrap.min.js" integrity="sha384-VjEeINv9OSwtWFLAtmc4JCtEJXXBub00gtSnszmspDLCtC0I4z4nqz7rEFbIZLLU" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="{$_modx->config.assets_url}default/css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tether/1.3.7/css/tether.min.css">
    <script type="text/javascript" src="{$_modx->config.assets_url}default/js/lastfm/lastfm.api.md5.js"></script>
    <script type="text/javascript" src="{$_modx->config.assets_url}default/js/lastfm/lastfm.api.js"></script>
    <link rel="stylesheet" type="text/css" href="//cdnjs.cloudflare.com/ajax/libs/jquery-jgrowl/1.4.1/jquery.jgrowl.min.css" />
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery-jgrowl/1.4.1/jquery.jgrowl.min.js"></script>
</head>
<body>
    {if $_modx->user.id==1}
    <header class="parser-header">
        <h1>Парсер событий</h1>
    </header>
    <div class="container">
        {$_modx->resource.content}
    </div>
    <div class="container" id="result">
        <h1></h1>
    </div>
    {ignore}
    <script>
    $('.getpic').on("click", function() {
    var image = 'none';
    //some shit code
    $(this).siblings('input.parser-img').addClass('this');
    //end of shit code
    var name = $(this).parents('.gig-parser-row').find('.artist-name').val();
    var lastfm = new LastFM({
        apiKey: 'f57a8103140d4c2d51210efb2e6609f7',
        apiSecret: 'bff41bd32113fd06b5883d5d44c99b5d'
    });
    lastfm.artist.getInfo({
        artist: name
    }, {
        success: function(data) {
            image = findUrl(data.artist.image, "extralarge");
            $('.this').val(image);
            $('.this').siblings('p').find('.pic_url').attr('href', image);
            $('.this').siblings('p').find('.pic_url').show("fast");
            $('.this').removeClass('this');
        },
        error: function(code, message) {}
    });

});

function findUrl(image, size) {
    var n, entry;

    for (n = 0; n < image.length; ++n) {
        // Get this entry from the array
        entry = image[n];

        // Is this the size we want?
        if (entry.size == size) { // (`size` is a valid identifier, can use a literal)
            // Yes, return this URL
            return entry["#text"]; // (`#text` is not, must use brackets and a string)
        }
    }
    return null; // Or "" or undefined or whatever you want to use for "not found"
}
$('.btn-danger').on("click", function() {
    $(this).parents('.gig-parser-row').hide("slow");
});
$('.save').on("click", function() {
    var parent = $(this).parents('.gig-parser-row');
    var gig = {
        title: $(parent).find('.artist-name').val(),
        date: $(parent).find('.date').val(),
        price: $(parent).find('.gig-price').val(),
        img: $(parent).find('.parser-img').val(),
        club: '[[*club]]',
        clubname: '[[#[[*club]].pagetitle]]'
    };
    gig = JSON.stringify(gig);
    // Берем действие из атрибута data-action ссылки
    // Ajax запрос к текущей страницы (а на ней наш сниппет) методом post
    $.post('ajax.php', {
        action: gig
    }, function(data) {
        $.jGrowl(data);
    })

    // Не даем ссылке кликнуться - нам же не нужна перезагрузка страницы?
    return false;
});
    </script>
    {/ignore}
    <script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.3.7/js/tether.min.js"></script>
    {else}
        <h2>Сюда низя</h2>
    {/if}
</body>
</html>