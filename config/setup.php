<?php

chdir(dirname(__DIR__));

define('SMARTY_DIR', 'vendor/smarty/smarty/libs/');

class Smarty_road extends Smarty {

    function __construct()
    {
        parent::__construct();

        $this->setTemplateDir('./templates');
        $this->setCompileDir('./templates_c');
        $this->setConfigDir('./configs');
        $this->setCacheDir('./cache');

        $this->caching = Smarty::CACHING_LIFETIME_CURRENT;
        $this->assign('app_name', 'road');
    }
}

setlocale(LC_ALL, 'de_DE.UTF-8');
date_default_timezone_set("Europe/Berlin");
$config = parse_ini_file('config/mysql_config.ini', TRUE);

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

const RESPONSE_NOTFOUND = 404;
const RESPONSE_FORBIDDEN = 403;

require 'config/validator.php';