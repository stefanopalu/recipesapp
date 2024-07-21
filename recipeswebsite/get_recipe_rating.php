<?php
header('Content-Type: application/json');

// Enable error reporting
error_reporting(E_ALL);
ini_set('display_errors', 1);

include 'database_connection.php';

$recipeId = $_GET['recipe_id'] ?? null;

if (!isset($recipeId)) {
    echo json_encode(['status' => 'error', 'message' => 'Invalid recipe ID']);
    exit;
}

$recipeId = intval($recipeId);

try {
    $query = $pdo->prepare("SELECT AVG(rating) as average_rating, COUNT(*) as rating_count FROM ratings WHERE recipe_id = ?");
    $query->execute([$recipeId]);
    $result = $query->fetch(PDO::FETCH_ASSOC);

    if ($result) {
        $averageRating = round($result['average_rating'], 1);
        $ratingCount = $result['rating_count'];

        $ratingText = $ratingCount > 0 ? "Current average rating: {$averageRating} Stars" : "No user ratings yet. Be the first to rate this recipe!";
        echo json_encode(['status' => 'success', 'rating' => $averageRating, 'rating_text' => $ratingText]);
    } else {
        echo json_encode(['status' => 'error', 'message' => 'Failed to retrieve rating']);
    }
} catch (PDOException $e) {
    echo json_encode(['status' => 'error', 'message' => 'Database error: ' . $e->getMessage()]);
} catch (Exception $e) {
    echo json_encode(['status' => 'error', 'message' => 'General error: ' . $e->getMessage()]);
}
?>
