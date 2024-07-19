<?php
session_start(); // Ensure session is started

// Check if user is logged in
if (!isset($_SESSION['user_id'])) {
    echo json_encode(['status' => 'error', 'message' => 'User not logged in']);
    exit();
}

// Database connection details
include('db_connection.php');

$user_id = $_SESSION['user_id']; // Use session user ID

if (isset($_GET['recipe_id'])) {
    // Check if a specific recipe is favorited
    $recipe_id = $_GET['recipe_id'];

    // Prepare and execute SQL statement to check if recipe is favorited
    $stmt = $conn->prepare("SELECT COUNT(*) AS count FROM favorites WHERE recipe_id = ? AND user_id = ?");
    if ($stmt === false) {
        die("Prepare failed: " . $conn->error);
    }
    $stmt->bind_param("ii", $recipe_id, $user_id);
    $stmt->execute();
    $result = $stmt->get_result();
    $row = $result->fetch_assoc();

    $isFavorited = $row['count'] > 0;

    echo json_encode(['status' => 'success', 'favorited' => $isFavorited]);

    $stmt->close();
} else {
    // Fetch all favorite recipes
    $stmt = $conn->prepare("
        SELECT recipes.recipe_id, recipes.recipe_name, recipes.image_path
        FROM recipes
        JOIN favorites ON recipes.recipe_id = favorites.recipe_id
        WHERE favorites.user_id = ?
    ");
    if ($stmt === false) {
        die("Prepare failed: " . $conn->error);
    }
    $stmt->bind_param("i", $user_id);
    $stmt->execute();
    $result = $stmt->get_result();

    $favorites = [];
    while ($row = $result->fetch_assoc()) {
        $favorites[] = $row;
    }

    echo json_encode(['status' => 'success', 'recipes' => $favorites]);

    $stmt->close();
}

$conn->close();
?>
