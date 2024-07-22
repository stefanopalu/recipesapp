<?php
session_start(); // Ensure session is started

ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

// Check if user is logged in
if (!isset($_SESSION['user_id'])) {
    echo "User not logged in";
    exit();
}

// Database connection details
include('db_connection.php'); // Make sure db_connection.php sets up $conn

$recipe_id = isset($_POST['recipeId']) ? intval($_POST['recipeId']) : null;
$rating = isset($_POST['rating']) ? intval($_POST['rating']) : null;
$user_id = $_SESSION['user_id']; // Get the user ID from the session

// Validate input values
if (!is_numeric($recipe_id) || !is_numeric($rating) || $rating < 1 || $rating > 5) {
    echo "Invalid input";
    exit();
}

// Check if the rating already exists
$check_stmt = $conn->prepare("SELECT * FROM ratings WHERE recipe_id = ? AND user_id = ?");
if ($check_stmt === false) {
    die("Prepare failed: " . $conn->error);
}
$check_stmt->bind_param("ii", $recipe_id, $user_id);
$check_stmt->execute();
$check_result = $check_stmt->get_result();

if ($check_result->num_rows > 0) {
    // Rating already exists, update it
    $stmt = $conn->prepare("UPDATE ratings SET value = ? WHERE recipe_id = ? AND user_id = ?");
    if ($stmt === false) {
        die("Prepare failed: " . $conn->error);
    }
    $stmt->bind_param("iii", $rating, $recipe_id, $user_id);
} else {
    // Rating does not exist, insert a new one
    $stmt = $conn->prepare("INSERT INTO ratings (recipe_id, user_id, value) VALUES (?, ?, ?)");
    if ($stmt === false) {
        die("Prepare failed: " . $conn->error);
    }
    $stmt->bind_param("iii", $recipe_id, $user_id, $rating);
}

$stmt->execute();

if ($stmt->affected_rows > 0) {
    // Calculate the new average rating
    $avg_stmt = $conn->prepare("
        UPDATE recipes 
        SET avg_rating = (SELECT AVG(value) FROM ratings WHERE recipe_id = ?)
        WHERE recipe_id = ?
    ");
    if ($avg_stmt === false) {
        die("Prepare failed: " . $conn->error);
    }
    $avg_stmt->bind_param("ii", $recipe_id, $recipe_id);
    $avg_stmt->execute();

    if ($avg_stmt->affected_rows > 0) {
        echo "success";
    } else {
        echo "Failed to update average rating.";
    }

    $avg_stmt->close();
} else {
    echo "Failed to save rating.";
}

$stmt->close();
$check_stmt->close();
$conn->close(); // Close the database connection
?>