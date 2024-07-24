<?php
// Include database connection
include 'db_connection.php';

// Function to fetch recipes by combined criteria
function fetchRecipes($criteria) {
    global $conn;

    // Base SQL query
    $sql = "SELECT DISTINCT r.recipe_id, r.recipe_name, r.category_id, r.image_path FROM recipes r";

    // Initialize where conditions and parameters
    $whereConditions = [];
    $params = [];
    $paramTypes = '';

    // Check for category_id
    if (!empty($criteria['category_id'])) {
        $whereConditions[] = "r.category_id = ?";
        $params[] = intval($criteria['category_id']);
        $paramTypes .= 'i';
    }

    // Check for ingredient_ids
    if (!empty($criteria['ingredient_ids'])) {
        $ingredientIds = explode(',', $criteria['ingredient_ids']);
        $placeholders = implode(',', array_fill(0, count($ingredientIds), '?'));
        $sql .= " INNER JOIN recipe_ingredients ri ON r.recipe_id = ri.recipe_id";
        $whereConditions[] = "ri.ingredient_id IN ($placeholders)";
        $params = array_merge($params, array_map('intval', $ingredientIds));
        $paramTypes .= str_repeat('i', count($ingredientIds));
    }

    // Check for cooking_time
    if (!empty($criteria['cooking_time'])) {
        $cookingTimes = [];
        switch ($criteria['cooking_time']) {
            case 'Short':
                $cookingTimes = ['no cooking required', 'less than 10 mins', '10 to 30 mins'];
                break;
            case 'Medium':
                $cookingTimes = ['30 mins to 1 hour', '1 to 2 hours'];
                break;
            case 'Long':
                $cookingTimes = ['over 2 hours'];
                break;
        }
        $placeholders = implode(',', array_fill(0, count($cookingTimes), '?'));
        $whereConditions[] = "r.cooking_time IN ($placeholders)";
        $params = array_merge($params, $cookingTimes);
        $paramTypes .= str_repeat('s', count($cookingTimes));
    }

    // Append where conditions to the base SQL query
    if (count($whereConditions) > 0) {
        $sql .= ' WHERE ' . implode(' AND ', $whereConditions);
    }

    // Add group by and having clause to ensure all ingredients are matched
    if (!empty($criteria['ingredient_ids'])) {
        $ingredientCount = count(explode(',', $criteria['ingredient_ids']));
        $sql .= " GROUP BY r.recipe_id HAVING COUNT(DISTINCT ri.ingredient_id) = ?";
        $params[] = $ingredientCount;
        $paramTypes .= 'i';
    }
    
    // Prepare and execute SQL statement
    $stmt = $conn->prepare($sql);
    if ($stmt === false) {
        die('MySQL prepare error: ' . htmlspecialchars($conn->error));
    }

    if (count($params) > 0) {
        $stmt->bind_param($paramTypes, ...$params);
    }

    $stmt->execute();
    $result = $stmt->get_result();

    // Fetch recipes
    $recipes = [];
    while ($row = $result->fetch_assoc()) {
        $recipes[] = $row;
    }

    $result->free();
    $stmt->close();

    return $recipes;
}

// Collect and sanitize criteria from GET request
$criteria = [
    'category_id' => isset($_GET['category_id']) ? intval($_GET['category_id']) : null,
    'ingredient_ids' => isset($_GET['ingredient_ids']) ? $_GET['ingredient_ids'] : null,
    'cooking_time' => isset($_GET['cooking_time']) ? $_GET['cooking_time'] : null
];

// Fetch recipes by combined criteria
$recipes = fetchRecipes($criteria);

// Convert output $recipes to JSON format
header('Content-Type: application/json');
echo json_encode($recipes);

// Close database connection
$conn->close();
?>
