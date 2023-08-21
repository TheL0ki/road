<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

require 'config/setup.php';
require 'config/config.php';
require 'config/db_cnx.php';
require 'config/func.php';

session_start();

$userId = filter_input(INPUT_POST, 'userId', FILTER_SANITIZE_SPECIAL_CHARS);
$y = filter_input(INPUT_POST, 'y', FILTER_SANITIZE_SPECIAL_CHARS);
$m = filter_input(INPUT_POST, 'm', FILTER_SANITIZE_SPECIAL_CHARS);
$input = filter_input_array(INPUT_POST, FILTER_SANITIZE_SPECIAL_CHARS);

unset($input['userId']);
unset($input['y']);
unset($input['m']);

foreach($input as $key => $result) {
    if(checkShift($y,$m,$key,$userId)) {
        if($result != NULL && $result != '---') {
            updateShift($y,$m,$key,$userId,$result);            
            header('location: index.php?m='.$m.'&y='.$y);
        } else {
            deleteShift($y,$m,$key,$userId);
            header('location: index.php?m='.$m.'&y='.$y);
        }
    } else {
        if($result != NULL) {
            saveShift($y,$m,$key,$userId,$result);
            header('location: index.php?m='.$m.'&y='.$y);
        }
    }
}

?>