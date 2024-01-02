<?php
$mysqli = new mysqli(
    $config['database_road']['database_host'],
    $config['database_road']['database_user'],
    $config['database_road']['database_pwd'],
    $config['database_road']['database_name']);
if($mysqli->errno) {
    echo "Failed to connect to database" . $mysqli->error;
    die;
}

$mysqli->query("SET NAMES 'utf8'");
$mysqli->set_charset('utf8');