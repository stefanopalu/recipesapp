<?php
session_start();

$response = array();
if (isset($_SESSION['username'])) {
    $response['status'] = 'success'; // User is logged in
} else {
    $response['status'] = 'failure'; // User is not logged in
}

echo json_encode($response);
?>