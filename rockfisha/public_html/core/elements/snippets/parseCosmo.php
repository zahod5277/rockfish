<?php

/** @var pdoTools $pdo */
$pdo = $modx->getService('pdoTools');

require('phpQuery/phpQuery/phpQuery.php');
$page = file_get_contents('http://www.cosmonavt.su/');
  $document = phpQuery::newDocument($page);
  $events = $document->find('.billboard .concert');
  $i=1;
  if ($tpl == ''){
      $tpl = '@FILE: chunks/parser.gig.tpl';
  }
  foreach ($events as $event){
       $day = pq($event)->find('.add_date');
        $day = htmlspecialchars(pq($day)->text());
        $month = pq($event)->find('.add_month');
        $month = pq($month)->text();
        $month = month_replace($month);
        $currMonth = date('m');
        if ($month<$currMonth){
            $year = date('Y')+1;
        } else {
            $year = date('Y');
        }
        $date = $year."-".$month."-".$day." 00:00:00";        
        $title = pq($event)->find('.add_title a.nostyle');
        $title = pq($title)->text();
        $title = str_replace('&amp','',$title);
        $price = pq($event)->find('.add_ticket');
        $price = pq($price)->text();
        $price = trim($price);
        $price = s_rep($price);
        $price = htmlspecialchars(str_replace('р','р ',$price));
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


function s_rep($str){
    return str_replace('			','',$str);
}

function month_replace($month){
    $months = array(
        'января' => '01',
        'февраля' => '02',
        'марта' => '03',
        'апреля' => '04',
        'мая' => '05',
        'июня' => '06',
        'июля' => '07',
        'августа' => '08',
        'сентября' => '09',
        'октября' => '10',
        'ноября' => '11',
        'декабря' => '12',
        );
    return $months[$month];
}
