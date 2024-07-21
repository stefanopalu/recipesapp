<?php
// Enable error reporting for debugging purposes
error_reporting(E_ALL);
ini_set('display_errors', 1);

// Check if the required POST parameters are set
if (isset($_POST['recipeId']) && isset($_POST['rating'])) {
    $recipeId = intval($_POST['recipeId']); // Sanitize input
    $rating = floatval($_POST['rating']); // Sanitize input

    // Validate rating
    if ($rating < 1 || $rating > 5) {
        http_response_code(400);
        echo json_encode(['status' => 'error', 'message' => 'Invalid rating value']);
        exit();
    }

    // Database connection
    $mysqli = new mysqli('localhost', 'username', 'password', 'database');

    // Check for database connection error
    if ($mysqli->connect_error) {
        http_response_code(500);
        echo json_encode(['status' => 'error', 'message' => 'Database connection failed']);
        exit();
    }

    // Prepare and execute the SQL query
    $stmt = $mysqli->prepare("
        INSERT INTO ratings (recipe_id, rating) 
        VALUES (?, ?) 
        ON DUPLICATE KEY UPDATE rating = VALUES(rating)
    ");
    if (!$stmt) {
        http_response_code(500);
        echo json_encode(['status' => 'error', 'message' => 'Failed to prepare SQL statement']);
        exit();
    }

    $stmt->bind_param('id', $recipeId, $rating);

    if ($stmt->execute()) {
        // Calculate new average rating
        $result = $mysqli->query("SELECT AVG(rating) AS average_rating FROM ratings WHERE recipe_id = $recipeId");
        if ($result) {
            $averageRating = $result->fetch_assoc()['average_rating'] ?? 0; // Default to 0 if null
            echo json_encode(['status' => 'success', 'newAverageRating' => $averageRating]);
        } else {
            http_response_code(500);
            echo json_encode(['status' => 'error', 'message' => 'Failed to fetch average rating']);
        }
    } else {
        http_response_code(500);
        echo json_encode(['status' => 'error', 'message' => 'Failed to execute SQL statement']);
    }

    $stmt->close();
    $mysqli->close();
} else {
    http_response_code(400);
    echo json_encode(['status' => 'error', 'message' => 'Missing required parameters']);
}
