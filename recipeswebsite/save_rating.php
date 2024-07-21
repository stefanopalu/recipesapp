<?php
header('Content-Type: application/json');

// Enable error reporting (remove or adjust for production)
error_reporting(E_ALL);
ini_set('display_errors', 1);

include 'database_connection.php';

$recipeId = $_POST['recipeId'] ?? null;
$userId = $_POST['userId'] ?? null; // Ensure userId is provided
$rating = $_POST['rating'] ?? null;

// Validate inputs
if (!is_numeric($recipeId) || !is_numeric($userId) || !is_numeric($rating) || $rating < 1 || $rating > 5) {
    echo json_encode(['status' => 'error', 'message' => 'Invalid input']);
    exit;
}

$recipeId = intval($recipeId);
$userId = intval($userId);
$rating = intval($rating);

try {
    $query = $pdo->prepare("
        INSERT INTO ratings (recipe_id, user_id, value)
        VALUES (?, ?, ?)
        ON DUPLICATE KEY UPDATE value = ?
    ");
    $query->execute([$recipeId, $userId, $rating, $rating]);

    if ($query->rowCount() > 0) {
        echo json_encode(['status' => 'success', 'message' => 'Rating saved']);
    } else {
        echo json_encode(['status' => 'error', 'message' => 'Failed to save rating']);
    }
} catch (PDOException $e) {
    echo json_encode(['status' => 'error', 'message' => 'Database error: ' . $e->getMessage()]);
} catch (Exception $e) {
    echo json_encode(['status' => 'error', 'message' => 'General error: ' . $e->getMessage()]);
}
?>
