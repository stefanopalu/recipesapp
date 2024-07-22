<?php
// Fetch user data based on session
error_reporting(E_ALL);
ini_set('display_errors', 1);

// Include database connection
include('db_connection.php');

// Start session
session_start();

// Check if user is logged in
if (!isset($_SESSION['username'])) {
    header('Content-Type: application/json');
    echo json_encode(['status' => 'error', 'message' => 'User not logged in.']);
    exit();
}

// Get the username from session
$username = $_SESSION['username'];

// Function to get user data
function getUserData($username, $conn) {
    $stmt = $conn->prepare("SELECT username, firstname, lastname, email FROM users WHERE username = ?");
    if ($stmt === false) {
        die("Prepare failed: " . $conn->error);
    }
    $stmt->bind_param("s", $username);
    $stmt->execute();
    $result = $stmt->get_result();
    $data = $result->fetch_assoc();
    $stmt->close();
    return $data;
}

// Fetch user data
$userData = getUserData($username, $conn);

// Return user data as JSON response
header('Content-Type: application/json');
if ($userData) {
    echo json_encode([
        'status' => 'success',
        'userData' => $userData
    ]);
} else {
    echo json_encode(['status' => 'error', 'message' => 'User data not found.']);
}

$conn->close();
?>
