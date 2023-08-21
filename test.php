<?php

$date = DateTime::createFromFormat('Y-m-d', '2023-10-01');

$loopDay = $date;
for($i = 1; $i <= $date->format('t'); $i++) {
    echo 'Loop: '. $i . "\r\n";
    echo $loopDay->format('d') . "\r\n";
    $loopDay->modify('+1 day');
}