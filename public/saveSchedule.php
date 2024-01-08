<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

chdir(dirname(__DIR__));
require_once 'vendor/autoload.php';

require 'config/setup.php';
require 'config/func.php';

session_start();

$userId = filter_input(INPUT_POST, 'userId', FILTER_SANITIZE_SPECIAL_CHARS);
$y = filter_input(INPUT_POST, 'y', FILTER_SANITIZE_SPECIAL_CHARS);
$m = filter_input(INPUT_POST, 'm', FILTER_SANITIZE_SPECIAL_CHARS);
$input = filter_input_array(INPUT_POST, FILTER_SANITIZE_SPECIAL_CHARS);

unset($input['userId']);
unset($input['y']);
unset($input['m']);

foreach($input['shift'] as $key => $result) {    
    if(!array_key_exists('homeOffice', $result)) {
        $result['homeOffice'] = 0;
    } else {
        $result['homeOffice'] = 1;
    }

    if(checkShift($y,$m,$key,$userId)) {
        if($result['shift'] != NULL && $result['shift'] != '---') {
            updateShift($y, $m, $key, $userId, $result['shift'], $result['homeOffice']);         
            header('location: main.php?m='.$m.'&y='.$y);
        } else {
            deleteShift($y,$m,$key,$userId);
            header('location: main.php?m='.$m.'&y='.$y);
        }
    } else {
        if($result['shift'] != NULL) {
            saveShift($y,$m,$key,$userId,$result['shift'], $result['homeOffice']);
            header('location: main.php?m='.$m.'&y='.$y);
        }
    }
}