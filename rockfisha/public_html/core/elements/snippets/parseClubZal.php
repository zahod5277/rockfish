<?php
$pdo = $modx->getService('pdoTools');
  if ($tpl == ''){
      $tpl = '@FILE: chunks/parser.gig.tpl';
  }
require('phpQuery/phpQuery/phpQuery.php');
$page = file_get_contents('http://clubzal.com/');
  $document = phpQuery::newDocument($page);
  $events = $document->find('.afisha .item');
  $i=0;
  foreach ($events as $event){
       $day = pq($event)->find('td.date>.day>span:first');
       $day = pq($day)->text();
       $day = s_rep($day);
       $month = pq($event)->find('td.date>.month');
       $month = pq($month)->text();
       $month = month_replace($month);
       $currMonth = date('m');
        if ($month<$currMonth){
            $year = date('Y')+1;
        } else {
            $year = date('Y');
        }
        $date = $year."-".$month."-".$day." 00:00:00";
        $img = pq($event)->find('td.pict img');
        $img = pq($img)->attr('src');
        $title = pq($event)->find('td.info .event_title h3');
        $title = pq($title)->text();
        $title = str_replace("&",'',$title);
        $title = str_replace("and",'аnd',$title);
        $price = pq($event)->find('.prices');
        $price = pq($price)->text();
        $price = trim($price);
        $price = s_rep($price);
        $i++;
        $placeholders = array(
          'idx' => $i,
          'title' => $title,
          'date' => $date,
          'price' => $price  
        );
        $output .= $pdo->getChunk($tpl, $placeholders);
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
