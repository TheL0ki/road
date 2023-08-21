<?php

ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

require 'config/setup.php';
require 'config/config.php';
require 'config/db_cnx.php';
require 'config/func.php';

$allUsers = getAllActiveUser();
foreach($allUsers as $user) {
    $year = 2023;
    $day = 8;
    $month = 12;
    $shift = 14;

    if(checkShift($year, $month, $day, $user['id'])) {
        updateShift($year, $month, $day, $user['id'], $shift);
        echo 'User '. $user['id'] . ' shift updated ' . "\r\n";
    } else {
        saveShift($year, $month, $day, $user['id'], $shift);
        echo 'User '. $user['id'] . ' shift saved ' . "\r\n";
    }    
}

?>