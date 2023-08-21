<?php

ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

require 'config/setup.php';
require 'config/config.php';
require 'config/db_cnx.php';
require 'config/func.php';

session_start();
$smarty = new Smarty_Road();

if(isset($_GET['save'])) {
    $allUsers = getAllActiveUser();
    foreach($allUsers as $user) {
        if($user['team'] == 1 AND $user['model'] == 'VZ' and $user['id'] != 1) {
            $month = 10;
            $year = 2023;
            $shift = 3;
            $createDate = $year . '-' . $month . '-01';
    
            $date = DateTime::createFromFormat('Y-m-d', $createDate);
            for($i = 1; $i <= $date->format('t'); $i++) {
                $checkDate = DateTime::createFromFormat('Y-m-d', $year . '-' . $month . '-' . $i);
                if(!($checkDate->format('N') == '5') AND !($checkDate->format('N') == '6') AND !($checkDate->format('N') == '7')) {
                    $currentShift = checkShift($year, $month, $i, $user['id']);
                    if($currentShift != FALSE) {
                        if($currentShift['shift'] != 14 AND $currentShift['shift'] != 10) {
                            updateShift($year, $month, $i, $user['id'], $shift);
                            echo 'User '. $user['id'] . ' shift updated ' . "\r\n";
                        } else {
                            echo 'Holiday. Skipping update' . "\r\n";
                        }
                    } else {
                        saveShift($year, $month, $i, $user['id'], $shift);
                        echo 'User '. $user['id'] . ' shift saved ' . "\r\n";
                    }
                }
            }
        }
    }   
} else {
    $smarty->display('setShift.tpl');
}

?>