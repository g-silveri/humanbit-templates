<?php  
require __DIR__ . '/vendor/autoload.php';
use Minishlink\WebPush\WebPush;
use Minishlink\WebPush\Subscription;
$dbhost = "localhost:3306";
$dbuser = "webuser";
$dbpass = "webuser";
$dbname = "notifications_endpoint";
$conn = new mysqli($dbhost, $dbuser, $dbpass, $dbname);
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$payload = json_decode(file_get_contents('php://input'), true);
print_r($payload);
$sql = "SELECT * from subscriptions WHERE endpoint <> 'Safari'";
$subscriptions = mysqli_fetch_all($conn->query($sql), MYSQLI_ASSOC);

$auth = array(
    'VAPID' => array(
        'subject' => 'https://ecom1.humanbit.com/',
        'publicKey' => file_get_contents(__DIR__ . '/keys/public_key.txt'),
        'privateKey' => file_get_contents(__DIR__ . '/keys/private_key.txt'),
    ),
);
$webPush = new WebPush($auth);

foreach ($subscriptions as $subscription) {
    $sub = [
        'subscription' => Subscription::create([
            'endpoint' => $subscription[endpoint],
            'publicKey' => $subscription[publicKey],
            'authToken' => $subscription[authKey],
        ]),
        'payload' => $payload
    ];
    $webPush->queueNotification(
        $sub['subscription'],
        $sub['payload'][payload]
    );
}

foreach ($webPush->flush() as $report) {
    $endpoint = $report->getRequest()->getUri()->__toString();

    if ($report->isSuccess()) {
        echo "[v] Message sent successfully for subscription {$endpoint}.";
    } else {
        echo "[x] Message failed to sent for subscription {$endpoint}: {$report->getReason()}";
    }
}

$conn->close();