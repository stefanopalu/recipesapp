<?php

ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

// Include database connection
include 'db_connection.php';

// Check if recipe_id parameter exists in GET request
if (isset($_GET['recipe_id'])) {
    // Sanitize the input to prevent SQL injection
    $recipe_id = intval($_GET['recipe_id']); // Convert to integer for safety

    // Prepare SQL statement
    $sql = "SELECT recipe_name, description, preparation_time, cooking_time, instructions_steps, image_path FROM recipes WHERE recipe_id = ?";
    $stmt = $conn->prepare($sql);

    if ($stmt === false) {
        die('MySQL prepare error: ' . htmlspecialchars($conn->error));
    }

    // Bind parameter and execute statement
    $stmt->bind_param('i', $recipe_id);
    $stmt->execute();

    // Get result set
    $result = $stmt->get_result();

    // Fetch data as associative array
    if ($row = $result->fetch_assoc()) {
        $recipe = [
            'recipe_name' => $row['recipe_name'],
            'description' => $row['description'],
            'prep_time' => $row['preparation_time'],
            'cook_time' => $row['cooking_time'],
            'instructions_steps' => explode('|', $row['instructions_steps']),
            'image_path' => $row['image_path'],
        ];
    } else {
        $recipe = null;
    }

    // Free result set and close statement
    $stmt->free_result();
    $stmt->close();

    // Prepare SQL statement to fetch ingredients for the recipe
    $sql_ingredients = "SELECT i.ingredient_name, ri.quantity FROM recipe_ingredients ri
                        INNER JOIN ingredients i ON ri.ingredient_id = i.ingredient_id
                        WHERE ri.recipe_id = ?";
    $stmt_ingredients = $conn->prepare($sql_ingredients);

    if ($stmt_ingredients === false) {
        die('MySQL prepare error: ' . htmlspecialchars($conn->error));
    }

    // Bind parameter and execute statement for ingredients
    $stmt_ingredients->bind_param('i', $recipe_id);
    $stmt_ingredients->execute();

    // Get result set for ingredients
    $result_ingredients = $stmt_ingredients->get_result();

    // Fetch ingredients data as associative array
    $ingredients = [];
    while ($row_ingredients = $result_ingredients->fetch_assoc()) {
        $ingredients[] = [
            'ingredient_name' => $row_ingredients['ingredient_name'],
            'quantity' => $row_ingredients['quantity'],
        ];
    }

    // Assign ingredients to recipe array
    $recipe['ingredients'] = $ingredients;

    // Free result set and close statement for ingredients
    $stmt_ingredients->free_result();
    $stmt_ingredients->close();

    // Output JSON
    header('Content-Type: application/json');
    echo json_encode($recipe);
} else {
    // Handle case where recipe_id parameter is missing
    http_response_code(400); // Bad Request
    echo json_encode(array("error" => "Missing recipe_id parameter"));
}

// Close database connection
$conn->close();
?>
