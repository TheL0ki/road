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

$id = filter_input(INPUT_GET, 'id', FILTER_SANITIZE_SPECIAL_CHARS);

$user = getUser($id);

$smarty->assign('user', $user);
$smarty->display('changeUser.tpl');
} else {
    http_response_code(RESPONSE_FORBIDDEN);
}