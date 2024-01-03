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

    if(!empty($_POST)) {
        $firstname = filter_input(INPUT_POST, 'inputFirstname', FILTER_SANITIZE_SPECIAL_CHARS);
        $lastname = filter_input(INPUT_POST, 'inputLastname', FILTER_SANITIZE_SPECIAL_CHARS);
        $email = filter_input(INPUT_POST, 'inputEmail', FILTER_SANITIZE_SPECIAL_CHARS);
        $pwd = filter_input(INPUT_POST, 'inputPwd', FILTER_SANITIZE_SPECIAL_CHARS);
        $team = filter_input(INPUT_POST, 'inputTeam', FILTER_SANITIZE_SPECIAL_CHARS);
        $admin = filter_input(INPUT_POST, 'inputAdmin', FILTER_SANITIZE_SPECIAL_CHARS);
        $model = filter_input(INPUT_POST, 'model', FILTER_SANITIZE_SPECIAL_CHARS);

        if($admin != 1) {
            $admin = 0;
        }

        $saveNewUser = createUser($firstname, $lastname, $email, $pwd, $team, $model, $admin);

        if($saveNewUser == TRUE) {
            $smarty->display('success.tpl');
            header('Refresh:3; url=index.php', true);
        } else {
            echo 'ERROR';
        }
    } else {
        $smarty->assign('teams', getTeams());
        $smarty->assign('session', $_SESSION["user"]);
        $smarty->display('createUser.tpl');
    }
} else {
    header('location: index.php');
}