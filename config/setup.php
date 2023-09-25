<?php
define('SMARTY_DIR', '../../resources/smarty/');
define('SMARTY_SYSPLUGINS_DIR', '../../resources/smarty/sysplugins/');
require('../../resources/smarty/Smarty.class.php');

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
?>