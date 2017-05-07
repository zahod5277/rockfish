<?php
$pdo = $modx->getService('pdoTools');
  if ($tpl == ''){
      $tpl = '@FILE: chunks/parser.gig.tpl';
  }
require('phpQuery/phpQuery/phpQuery.php');
$page = file_get_contents('http://aurora-hall.ru/');
  $document = phpQuery::newDocument($page);
  $events = $document->find('.afisha .item');
  $i=0;
  foreach ($events as $event){
       $date = pq($event)->find('.date');
        $date = pq($date)->text();
        $date = s_rep($date);
        $date = trim($date);
        $date = explode(".",$date);
        if (strlen($date[1])==1){
            $month="0".$date[1];
        } else {
            $month=$date[1];
        }
        $day = $date[0];
        $currMonth = date('m');
        if ($month<$currMonth){
            $year = date('Y')+1;
        } else {
            $year = date('Y');
        }
         $date = $year."-".$month."-".$day." 00:00:00";
        $title = pq($event)->find('.name-group a');
        $title = pq($title)->text();
        $price = pq($event)->find('.price');
        $price = pq($price)->text();
        $price = trim($price);
        $price = s_rep($price);
        $price = str_replace('р','р ',$price);
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