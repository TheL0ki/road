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
	$smarty = new Smarty_Road();

	$users = getAllActiveUser();

	if(isset($_GET['save'])) {
	   $month = filter_input(INPUT_POST, 'month', FILTER_SANITIZE_SPECIAL_CHARS);
	   $year = filter_input(INPUT_POST, 'year', FILTER_SANITIZE_SPECIAL_CHARS);
	   $shift = filter_input(INPUT_POST, 'shift', FILTER_SANITIZE_SPECIAL_CHARS);
	   $checkedUsers = filter_input(INPUT_POST, 'checkedUser', FILTER_SANITIZE_SPECIAL_CHARS, FILTER_REQUIRE_ARRAY);
	   $weekdays = filter_input(INPUT_POST, 'weekdayCheck', FILTER_SANITIZE_SPECIAL_CHARS, FILTER_REQUIRE_ARRAY);
	   
	   foreach($checkedUsers as $userID) {

		  $user = getUser($userID);

		  $createDate = $year . '-' . $month . '-01';
		  $date = DateTime::createFromFormat('Y-m-d', $createDate);

		  for($i = 1; $i <= $date->format('t'); $i++) {
			 $checkDate = DateTime::createFromFormat('Y-m-d', $year . '-' . $month . '-' . $i);
			 if(in_array($checkDate->format('N'), $weekdays)) {
				$currentShift = checkShift($year, $month, $i, $user['id']);
				if($currentShift != FALSE) {
					if($currentShift['shift'] != 14 AND $currentShift['shift'] != 10 AND $currentShift['shift'] != 18 AND $currentShift['shift'] != 13) {
					   updateShift($year, $month, $i, $user['id'], $shift);
					   // echo 'User '. $user['id'] . ' shift updated ' . "\r\n <br>";
					} else {
					   // echo 'Holiday. Skipping update' . "\r\n <br>";
					}
				} else {
					   saveShift($year, $month, $i, $user['id'], $shift);
					   // echo 'User '. $user['id'] . ' shift saved ' . "\r\n <br>";
				}
			 }
		  }
	   }
	   header('location: index.php?m='.$month.'&y='.$year);
	}
	$now = new DateTime();
	$selectDate = date_create($now->format('Y').'-'.$now->format('m').'-1');

	$smarty->assign('shift', getShifts());
	$smarty->assign('date', $selectDate);
	$smarty->assign('users', $users);
	$smarty->assign('session', $_SESSION["user"]);
	$smarty->display('setShift.tpl');
} else {
	header('location: index.php');
}