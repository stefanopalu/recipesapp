<?php
session_start();

if (isset($_SESSION['username'])) {
    echo json_encode(['status' => 'success', 'username' => $_SESSION['username']]);
} else {
    echo json_encode(['status' => 'error']);
}
?>