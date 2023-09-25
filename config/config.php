<?php
setlocale(LC_ALL, 'de_DE.UTF-8');
date_default_timezone_set("Europe/Berlin");
$config = parse_ini_file('../../resources/mysqli_config.ini', TRUE);
$strQuery = "SET character_set_results = 'utf8',
				character_set_client = 'utf8',
				character_set_connection = 'utf8',
				character_set_database = 'utf8',
				character_set_server = 'utf8'";