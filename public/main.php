<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

chdir(dirname(__DIR__));
require_once 'vendor/autoload.php';

require 'config/setup.php';
require 'config/func.php';

session_start();
if(isset($_SESSION["user"])) {
    $smarty = new Smarty_Road();
    if(isset($_GET['m'])) {
        $m = filter_input(INPUT_GET, 'm', FILTER_SANITIZE_SPECIAL_CHARS);
        $y = filter_input(INPUT_GET, 'y', FILTER_SANITIZE_SPECIAL_CHARS);
    }

    if(isset($_GET['t'])) {
        $team = filter_input(INPUT_GET, 't', FILTER_SANITIZE_SPECIAL_CHARS);
    } else {
        $team = 'all';
    }

    $months = array(
        1 => 'January',
        2 => 'February',
        3 => 'March',
        4 => 'April',
        5 => 'May',
        6 => 'June',
        7 => 'July',
        8 => 'August',
        9 => 'September',
        10 => 'October',
        11 => 'November',
        12 => 'December'
    );

    $schedule = array();

    switch($team) {
        case 'all':
            $users = getAllActiveUser();
            break;
        case 'me':
            $users[] = getUser($_SESSION['user']['id']);
            break;
        default:
            $users = getUsersFromTeam($team);
    }

    if(isset($m)) {
        $date = date_create($y.'-'.$m.'-1');
    } else {
        $now = new DateTime();
        $date = date_create($now->format('Y').'-'.$now->format('m').'-1');
    }

    foreach($users as $user) {
        $userShifts = getSchedule($user['id'],date_format($date, 'm'),date_format($date, 'Y'));
        $schedule[$user['id']] = $userShifts;
    }

    $dateTable = array();
    $loopDay = DateTime::createFromFormat('Y-m-d', $date->format('Y-m-d'));
    for($i = 1; $i <= $date->format('t'); $i++) {
        $dateTable[$i]['d'] = $loopDay->format('d');
        $dateTable[$i]['N'] = $loopDay->format('N');
        $dateTable[$i]['ymd'] = $loopDay->format('Y-m-d');
        $loopDay->modify('+1 day');
    }

    $smarty->assign('dateTable', $dateTable);
    $smarty->assign('team', $team);
    $smarty->assign('listTeams', getTeams());
    $smarty->assign('date', $date);
    $smarty->assign('schedule', $schedule);
    $smarty->assign('months', $months);
    $smarty->assign('users', $users);
    $smarty->assign('setYear', $date->format('Y'));
    $smarty->assign('setMonth', $date->format('n'));
    $smarty->display('main.tpl');
} else {
    http_response_code(RESPONSE_FORBIDDEN);
    header('location: index.php');
}