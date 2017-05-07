<?php
define('MODX_API_MODE', true);
require 'index.php';
if (empty($_SERVER['HTTP_X_REQUESTED_WITH']) || $_SERVER['HTTP_X_REQUESTED_WITH'] != 'XMLHttpRequest') {
    return;
}
if (empty($_POST['action'])) {
    return;
}
$res = '';
$gig = json_decode($_POST['action'], true);
$date = $gig['date'];
$date = DateTime::createFromFormat('Y-m-d h:i:s', $date);
$date = ($date->getTimestamp());
$publishedon = strftime('%Y-%m-%d',$date);
$unpub_date = strftime('%Y-%m-%d',strtotime('+1 Day', $date));
$description = str_replace(' 00:00:00', '',$gig['date']).' в клубе ' .$gig['clubname'].' состоится концерт '.$gig['title'].'. Стоимость билетов от '.$gig['price'];
$content = $description
        . '<p>'
        . $gig['content']
        . '</p>';

$page = $modx->newObject('modResource');
$alias = $page->cleanAlias($gig['title']).'-'.$publishedon;
$aliasPath = $page->getAliasPath($alias);

$response = $modx->runProcessor('resource/create', array(
    'pagetitle' => $gig['title'],
    'parent' => $gig['club'],
    'content' => $content,
    'unpub_date' => $unpub_date,
    'description' => $description,
    'publishedon' => $publishedon,
    'template' => '4',
    'published' => '1',
    'alias' => $alias,
    'tvs' => true,
    'tv1' => $gig['clubname'],
    'tv4' => $date,
    'tv3' => $gig['price'],
    'tv2' => $gig['img'],
    'tv5' => $gig['genre']
    ));
if ($response->isError()) {
    $res = 'Возникла ошибка создания ресурса';
} else {
    $res = "Успешно создан ресурс ".$gig['title'];
}
if (!empty($res)) {
    die($res);
}

