<?php

ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

chdir(dirname(__DIR__));
require_once 'vendor/autoload.php';

require 'config/setup.php';
require 'config/func.php';

session_start();
if(isset($_SESSION["user"]) AND $_SESSION["user"]["admin"] == 1) {
    $allUsers = getAllActiveUser();
    $day = filter_input(INPUT_POST, 'day', FILTER_SANITIZE_SPECIAL_CHARS);
    $month = filter_input(INPUT_POST, 'month', FILTER_SANITIZE_SPECIAL_CHARS);
    $year = filter_input(INPUT_POST, 'year', FILTER_SANITIZE_SPECIAL_CHARS);
    $shift = 14;

    foreach($allUsers as $user) {

        if(checkShift($year, $month, $day, $user['id'])) {
            updateShift($year, $month, $day, $user['id'], $shift);
            //echo 'User '. $user['id'] . ' shift updated ' . "\r\n <br>";
        } else {
            saveShift($year, $month, $day, $user['id'], $shift);
            //echo 'User '. $user['id'] . ' shift saved ' . "\r\n <br>";
        }
    }

    header('location: index.php?m='.$month.'&y='.$year);
} else {
    header('location: index.php');
}