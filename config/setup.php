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
?>