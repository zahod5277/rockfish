<div class="col-xs-12 gig-parser-row">
    <div class="col-xs-1 no-padding">
        <input type="text" name="data[{$date}]" class="form-control date" value="{$date}">
    </div>
    <div class="col-xs-3 parser-row">
        <input type="text" name="name[{$idx}]" class="form-control artist-name" value="{$title}">
    </div>
    <div class="col-xs-3">
        <input type="text" name="img[{$idx}]" placeholder="Нажми сюда ->" class="form-control parser-img" value="">
        <span class="btn btn-primary getpic">
            <i class="fa fa-refresh"></i>
        </span>
        <p><a href="" target="_blank" class="pic_url" style="display:none">Ссылка на картинку</a></p>
    </div>
    <div class="col-xs-3">
        <input type="text" name="price[{$idx}]" class="form-control gig-price" value="{$price}">
    </div>
        <div class="col-xs-2">
    <button class="btn btn-primary save" type="submit"><i class="fa fa-save"></i></button>        
    <button class="btn btn-danger remove"><i class="fa fa-close"></i></button>
        </div>
</div>