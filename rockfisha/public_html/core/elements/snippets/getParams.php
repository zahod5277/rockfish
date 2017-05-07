<?php

$modx->setDebug(E_ALL & ~E_NOTICE); // sets error_reporting to everything except NOTICE remarks
$modx->setLogLevel(modX::LOG_LEVEL_DEBUG);
if (isset($_POST["ok"])) {
    return 'а вот тебе';
    for ($i = 1; $i <= $_POST['count']; $i++) {
        if ($_POST["check"][$i] == "on") {
            $response = $modx->runProcessor('resource/create', array(
                'parent' => $_POST['club'],
                'pagetitle' => $_POST['title'][$i],
                'alias' => str_replace('-00:00:00', '', $_POST['data'][$i]) . '-' . $_POST['title'][$i],
                'longtitle' => "Концерт " . $_POST['title'][$i] . " в Спб",
                'published' => '1',
                'template' => '3',
                'description' => "Концерт " . $_POST['title'][$i],
                'content' => $_POST['data'][$i] . " в Санкт-Петербурге в клубе " . $_POST['clubname'] . " состоится концерт " . $_POST['title'][$i] . ". Стоимость билетов " . $_POST['price'][$i] . ". Информация взята с официального сайта клуба " . $_POST['club'] . ".")
            );

            if ($response->isError()) {
                return print_r($modx->error->failure($response->getMessage())) . " !!!<br>";
            } else {
                $object = $response->getObject();
                print "\n";
                print "Был создан документ с ID {$object['id']}";
                $res = $modx->getObject('modResource', $object['id']);
                $res->setTVValue('img', $_POST['img'][$i]);
                $res->setTVValue('club', $_POST['clubname']);
                $res->setTVValue('price', $_POST['price'][$i]);
                $res->setTVValue('data', $_POST['data'][$i]);
            }
        }
    }
} else
    echo 'nope';