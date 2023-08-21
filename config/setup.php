<?php
define('SMARTY_DIR', '/var/www/html/resources/smarty/');
define('SMARTY_SYSPLUGINS_DIR', '/var/www/html/resources/smarty/sysplugins/');
require('/var/www/html/resources/smarty/Smarty.class.php');

class Smarty_road extends Smarty {

    function __construct()
    {
        parent::__construct();

        $this->setTemplateDir('/var/www/html/road/prod/templates');
        $this->setCompileDir('/var/www/html/road/prod/templates_c');
        $this->setConfigDir('/var/www/html/road/prod/configs');
        $this->setCacheDir('/var/www/html/road/prod/cache');

        $this->caching = Smarty::CACHING_LIFETIME_CURRENT;
        $this->assign('app_name', 'road');
    }
}
?>