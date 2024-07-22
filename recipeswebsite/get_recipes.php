<?php
// Include database connection
include 'db_connection.php';

// Function to fetch recipes by category
function fetchRecipesByCategory($category_id) {
    global $conn;

    // Define SQL query and prepare SQL statement using the db connection
    $sql = "SELECT recipe_id, recipe_name, category_id, image_path FROM recipes WHERE category_id = ?";
    $stmt = $conn->prepare($sql);

    // Check if preparing SQL statement fails
    if ($stmt === false) {
        die('MySQL prepare error: ' . htmlspecialchars($conn->error));
    }

    // Bind parameter $category_id to the prepared statement and execute it
    $stmt->bind_param('i', $category_id);
    $stmt->execute();

    // Get result set from the executed statement
    $result = $stmt->get_result();

    // Iterate through each row of the result set and append it in the array $recipes
    $recipes = [];
    while ($row = $result->fetch_assoc()) {
        $recipes[] = $row;
    }

    // Free result set and close statement
    $result->free();
    $stmt->close();

    return $recipes;
}

// Function to fetch recipes by ingredient
function fetchRecipesByIngredient($ingredient_id) {
    global $conn;

    // Define SQL query and prepare SQL statement using the db connection
    $sql = "SELECT r.recipe_id, r.recipe_name, r.category_id, r.image_path
            FROM recipes r
            INNER JOIN recipe_ingredients ri ON r.recipe_id = ri.recipe_id
            WHERE ri.ingredient_id = ?";
    $stmt = $conn->prepare($sql);

    // Check if preparing SQL statement fails
    if ($stmt === false) {
        die('MySQL prepare error: ' . htmlspecialchars($conn->error));
    }

    // Bind parameter $ingredient_id and execute statement
    $stmt->bind_param('i', $ingredient_id);
    $stmt->execute();

    // Get result set from executed statement
    $result = $stmt->get_result();

    // Iterate through each row of the result set and append it in the array $recipes
    $recipes = [];
    while ($row = $result->fetch_assoc()) {
        $recipes[] = $row;
    }

    // Free result set and close statement
    $result->free();
    $stmt->close();

    return $recipes;
}

// Function to fetch recipes by cooking time
function fetchRecipesByCookingTime($time_category) {
    global $conn;

    $cookingTimes = [];
    switch ($time_category) {
        case 'Short':
            $cookingTimes = ['no cooking required', 'less than 10 mins','10 to 30 mins'];
            break;
        case 'Medium':
            $cookingTimes = ['30 mins to 1 hour', '1 to 2 hours'];
            break;
        case 'Long':
            $cookingTimes = ['over 2 hours'];
            break;
    }

    // Generate a string of placeholders for the SQL query
    $placeholders = str_repeat('?,', count($cookingTimes) - 1) . '?';

    // Define SQL query with the generated placeholders and prepare SQL statement using the db connection
    $sql = "SELECT recipe_id, recipe_name, category_id, image_path, cooking_time FROM recipes WHERE cooking_time IN ($placeholders)";
    $stmt = $conn->prepare($sql);

    // Check if preparing SQL statement fails
    if ($stmt === false) {
        die('MySQL prepare error: ' . htmlspecialchars($conn->error));
    }

    // Bind parameter $time_category to the prepared statement and execute it
    $stmt->bind_param(str_repeat('s', count($cookingTimes)), ...$cookingTimes);
    $stmt->execute();

    // Get result set from the executed statement
    $result = $stmt->get_result();

    // Iterate through each row of the result set and append it in the array $recipes
    $recipes = [];
    while ($row = $result->fetch_assoc()) {
        $recipes[] = $row;
    }

    // Free result set and close statement
    $result->free();
    $stmt->close();

    return $recipes;
}

// Check if category_id, ingredient_id or cooking_time parameter exists in GET request
if (isset($_GET['category_id'])) {
    // Sanitize the input to prevent SQL injection
    $category_id = intval($_GET['category_id']); // Convert to integer for safety

    // Fetch recipes by category
    $recipes = fetchRecipesByCategory($category_id);

} elseif (isset($_GET['ingredient_id'])) {
    // Sanitize the input to prevent SQL injection
    $ingredient_id = intval($_GET['ingredient_id']); // Convert to integer for safety

    // Fetch recipes by ingredient
    $recipes = fetchRecipesByIngredient($ingredient_id);
    
} elseif (isset($_GET['cooking_time'])) { // New condition to check for cooking_time parameter

    $cooking_time = $_GET['cooking_time']; // No need to convert to integer, it's a string

    // Fetch recipes by cooking time
    $recipes = fetchRecipesByCookingTime($cooking_time);

} else {
    // Handle case where neither category_id nor ingredient_id parameter is provided
    http_response_code(400); // Bad Request
    echo json_encode(array("error" => "Missing category_id or ingredient_id parameter"));
    exit;
}

// Convert output $recipes to JSON format
header('Content-Type: application/json');
echo json_encode($recipes);

// Close database connection
$conn->close();
?>
