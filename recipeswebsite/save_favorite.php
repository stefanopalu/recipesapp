<?php
session_start(); // Ensure session is started

// Check if user is logged in
if (!isset($_SESSION['user_id'])) {
    echo "User not logged in";
    exit();
}

// Database connection details
include('db_connection.php');

$recipe_id = $_POST['recipeId'];
$favorited = $_POST['favorited'] == 'true' ? 1 : 0;
$user_id = $_SESSION['user_id']; // Use session user ID

// Prepare SQL statement based on whether to add or remove from favorites
if ($favorited) {
    $stmt = $conn->prepare("INSERT INTO favorites (recipe_id, user_id) VALUES (?, ?)");
} else {
    $stmt = $conn->prepare("DELETE FROM favorites WHERE recipe_id = ? AND user_id = ?");
}

if ($stmt === false) {
    die("Prepare failed: " . $conn->error);
}

$stmt->bind_param("ii", $recipe_id, $user_id);
$stmt->execute();

if ($stmt->affected_rows > 0) {
    echo "success";
} else {
    echo "Failed to update favorite status.";
}