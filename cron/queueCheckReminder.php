<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

chdir(dirname(__DIR__));
require_once 'vendor/autoload.php';

require 'config/setup.php';
require 'config/func.php';

$date = new DateTime();
$logdate = $date->format('Y-m-d H:i:s');
$date->modify('next Saturday');

$day = $date->format('d');
$month = $date->format('m');
$year = $date->format('Y');

$select = 'SELECT user FROM schedule WHERE day = ? AND month = ? and year = ?';
$stmt = $mysqli->prepare($select);
$stmt->bind_param('sss', $day, $month, $year);
$stmt->execute();
$result = $stmt->get_result();

$url = $_ENV['SLACK_WEBHOOK'];

while($row = $result->fetch_array()) {
    $user = getUser($row[0]);
}

$ch = curl_init($url);
$payload = json_encode([
    'user' => $user['slackID']
]);

curl_setopt($ch, CURLOPT_POSTFIELDS, $payload);
curl_setopt($ch, CURLOPT_HTTPHEADER, array('Content-Type: application/json'));
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
$result = curl_exec($ch);
curl_close($ch);

echo '[' . $logdate . '] Cron executed, User "' . $user['firstname'] . ' ' . $user['lastname'] . '" with SlackID "' . $user['slackID'] . '" has been notified. ' . "\r\n";