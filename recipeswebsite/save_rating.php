<?php
header('Content-Type: application/json');

// Enable error reporting
error_reporting(E_ALL);
ini_set('display_errors', 1);

include 'database_connection.php';

$recipeId = $_POST['recipeId'] ?? null;
$rating = $_POST['rating'] ?? null;

if (!isset($recipeId) || !isset($rating)) {
    echo json_encode(['status' => 'error', 'message' => 'Invalid input']);
    exit;
}

$recipeId = intval($recipeId);
$rating = intval($rating);

try {
    $query = $pdo->prepare("
    INSERT INTO ratings (recipe_id, user_id, rating)
    VALUES (?, ?, ?)
    ON DUPLICATE KEY UPDATE rating = ?
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
