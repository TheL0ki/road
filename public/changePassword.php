<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

chdir(dirname(__DIR__));
require_once 'vendor/autoload.php';

require 'config/setup.php';
require 'config/func.php';

session_start();
$smarty = new Smarty_Road();
if(isset($_SESSION["user"])) {
    if(isset($_POST['newPWD'])) {
        $oldPWD = filter_input(INPUT_POST, 'oldPWD', FILTER_SANITIZE_SPECIAL_CHARS);
        $newPWD = filter_input(INPUT_POST, 'newPWD', FILTER_SANITIZE_SPECIAL_CHARS);
        $userID = filter_input(INPUT_POST, 'userID', FILTER_SANITIZE_SPECIAL_CHARS);

        if(changePWD($oldPWD, $newPWD, $userID)) {
            header('location: selfManager.php');
        } else {
            echo 'ERR';
        }

    }
    
    $smarty->assign('session', $_SESSION["user"]);
    $smarty->display('changePassword.tpl');
} else {
    header('location: index.php');
}