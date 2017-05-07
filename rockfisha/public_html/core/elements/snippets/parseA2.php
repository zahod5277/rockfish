<?php
/** @var pdoTools $pdo */
$pdo = $modx->getService('pdoTools');
  if ($tpl == ''){
      $tpl = '@FILE: chunks/parser.gig.tpl';
  }
require('phpQuery/phpQuery/phpQuery.php');
$page = file_get_contents('http://a2.fm/');
  $document = phpQuery::newDocument($page);
  $events = $document->find('.css-events-list table tr');
  $i=0;
  foreach ($events as $event){
       $date = pq($event)->find('td:first');
        $date = pq($date)->text();
        $dates = explode(",",$date);
        $date = $dates[0];
        $date = trim($date);
        $date = explode('/',$date);
        $day = $date[0];
        //если месяц начинается 1-9, то добавить ноль. 
        //Можно конечно использовать формат даты, ну да ладно. 
        //Это ведь года два назад было написано... 
        if (strlen($date[1])==1){
            $month="0".$date[1];
        } else {
            $month=$date[1];
        }
        $currMonth = date('m');
        if ($month<$currMonth){
            $year = date('Y')+1;
        } else {
            $year = date('Y');
        }
         $date = $year."-".$month."-".$day." 00:00:00";
        $title = pq($event)->find('td:nth-child(3) b');
        $title = pq($title)->text();
        $price = pq($event)->find('td:nth-child(3) i');
        $price = pq($price)->text();
        $placeholders = array(
          'idx' => $i,
          'title' => $title,
          'date' => $date,
          'price' => $price
        );
        $output .= $pdo->getChunk($tpl, $placeholders);
        $i++;
  }
return $output;