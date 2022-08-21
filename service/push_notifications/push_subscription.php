<?php
$dbhost = "localhost:3306";
$dbuser = "webuser";
$dbpass = "webuser";
$dbname = "notifications_endpoint";
$conn = new mysqli($dbhost, $dbuser, $dbpass, $dbname);
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
  }
$subscription = json_decode(file_get_contents('php://input'), true);
$endpoint = $subscription[endpoint];
$publicKey = $subscription[publicKey];
$authToken = $subscription[authToken];
$method = $subscription[method];
if (!isset($subscription['endpoint'])) {
    echo 'Error: not a subscription';
    return;
}
switch ($method) {
    case 'POST':
        $sql = "INSERT INTO subscriptions (endpoint, publicKey, authKey) VALUES ('$endpoint', '$publicKey', '$authToken')";
        if ($conn->query($sql) === TRUE) {
            echo "Record inserted successfully";
          } else {
            echo "Error deleting record: " . $conn->error;
          }
        break;
    case 'DELETE':
        $sql = "DELETE FROM subscriptions WHERE authKey='$subscription[authToken]'";
        if ($conn->query($sql) === TRUE) {
            echo "Record deleted successfully";
          } else {
            echo "Error deleting record: " . $conn->error;
          }
        break;
    default:
        echo "Error: method not handled";
        return;
}
$conn->close();