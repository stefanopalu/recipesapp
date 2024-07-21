<?php
// Enable error reporting for debugging purposes
error_reporting(E_ALL);
ini_set('display_errors', 1);

// Check if recipe_id is set
if (isset($_GET['recipe_id'])) {
    $recipeId = intval($_GET['recipe_id']); // Sanitize input

    // Database connection
    $mysqli = new mysqli('localhost', 'username', 'password', 'database');

    // Check for database connection error
    if ($mysqli->connect_error) {
        http_response_code(500);
        echo json_encode(['status' => 'error', 'message' => 'Database connection failed']);
        exit();
    }

    // Prepare and execute the SQL query
    $stmt = $mysqli->prepare("SELECT AVG(rating) AS average_rating FROM ratings WHERE recipe_id = ?");
    if (!$stmt) {
        http_response_code(500);
        echo json_encode(['status' => 'error', 'message' => 'Failed to prepare SQL statement']);
        exit();
    }

    $stmt->bind_param('i', $recipeId);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result) {
        $data = $result->fetch_assoc();
        $averageRating = $data['average_rating'] ? $data['average_rating'] : 0; // Default to 0 if null
        echo json_encode(['status' => 'success', 'rating' => $averageRating]);
    } else {
        http_response_code(500);
        echo json_encode(['status' => 'error', 'message' => 'Failed to fetch rating']);
    }

    $stmt->close();
    $mysqli->close();
} else {
    http_response_code(400);
    echo json_encode(['status' => 'error', 'message' => 'Missing recipe_id']);
}
