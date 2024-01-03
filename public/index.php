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
    header('location: main.php');
} else {
    if(isset($_POST['email'])) {
        $email = filter_input(INPUT_POST, 'email', FILTER_SANITIZE_SPECIAL_CHARS);
        $pwd = filter_input(INPUT_POST, 'pwd', FILTER_SANITIZE_SPECIAL_CHARS);
        $login = loginUser($email, $pwd);

        if($login != FALSE) {
            $_SESSION["user"] = $login;
            header('location: main.php');            
        };
    }
    $smarty->display('index.tpl');
}