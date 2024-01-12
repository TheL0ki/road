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
if(isset($_SESSION["user"]))
{
    if($_SERVER['REQUEST_METHOD'] === 'POST') 
    {
        $email = filter_input(INPUT_POST, 'email', FILTER_SANITIZE_SPECIAL_CHARS);
        $userID = filter_input(INPUT_POST, 'userID', FILTER_SANITIZE_SPECIAL_CHARS);

        if(Validator::email($email))
        {
            if(!changeSettings($userID, $email)) 
            {
                echo "ERR";
                die;
            } 
            else
            {
                $_SESSION["user"]["email"] = $email;
                $smarty->display('success.tpl');
                header('Refresh:3; url=selfManager.php');
                die;
            }
        }
        else
        {
            echo "ERR";
            die;
        }
    }

    $smarty->display('selfManager.tpl');
} 
else
{
    header('location: index.php');
}