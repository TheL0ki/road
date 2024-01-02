<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

chdir(dirname(__DIR__));
require_once 'vendor/autoload.php';

require 'config/setup.php';
require 'config/config.php';
require 'config/db_cnx.php';
require 'config/func.php';

session_start();
$smarty = new Smarty_Road();

$id = filter_input(INPUT_GET, 'id', FILTER_SANITIZE_SPECIAL_CHARS);
$m = filter_input(INPUT_GET, 'm', FILTER_SANITIZE_SPECIAL_CHARS);
$y = filter_input(INPUT_GET, 'y', FILTER_SANITIZE_SPECIAL_CHARS);

$date = DateTime::createFromFormat('Y-m-d', $y.'-'.$m.'-1');

$dateTable = array();
$loopDay = DateTime::createFromFormat('Y-m-d', $date->format('Y-m-d'));
for($i = 1; $i <= $date->format('t'); $i++) {
    $dateTable[$i]['d'] = $loopDay->format('d');
    $dateTable[$i]['N'] = $loopDay->format('N');
    $dateTable[$i]['ymd'] = $loopDay->format('Y-m-d');
    $loopDay->modify('+1 day');
}

$smarty->assign('dateTable', $dateTable);
$smarty->assign('date', $date);
$smarty->assign('user', getUser($id));
$smarty->assign('schedule', getSchedule($id, $m, $y));
$smarty->assign('shift', getShifts());
$smarty->display('changeSchedule.tpl');
?>