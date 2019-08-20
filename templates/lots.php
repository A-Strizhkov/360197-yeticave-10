<li class="lots__item lot">
    <div class="lot__image">
        <img src="<?=esc($lot['item']); ?>" width="350" height="260" alt="">
    </div>
    <div class="lot__info">
        <span class="lot__category"><?=esc($lot['category']); ?></span>
<h3 class="lot__title"><a class="text-link" href="pages/lot.html"><?=esc($lot['title']); ?></a></h3>
<div class="lot__state">
    <div class="lot__rate">
        <span class="lot__amount">Стартовая цена</span>
        <span class="lot__cost"><?=esc(format_price($lot['price']));?></span>
    </div>
    <div class="lot__timer timer<?php if (format_date($lot['data_end']) == 0) echo ' timer--finishing'; ?>">
        <?=implode(' : ',format_date($lot['data_end'])); ?>
        |<?php var_dump(format_date($lot['data_end'])) ?>
    </div>
</div>
</div>
</li>
