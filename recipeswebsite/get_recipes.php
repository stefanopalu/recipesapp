<?php
// Include database connection
include 'db_connection.php';

// Check if category_id parameter exists in GET request
if (isset($_GET['category_id'])) {
    // Sanitize the input to prevent SQL injection
    $category_id = intval($_GET['category_id']); // Convert to integer for safety

    // Prepare SQL statement
    $sql = "SELECT recipe_id, recipe_name, category_id FROM recipes WHERE category_id = ?";
    $stmt = $conn->prepare($sql);

    if ($stmt === false) {
        die('MySQL prepare error: ' . htmlspecialchars($conn->error));
    }

    // Bind parameter and execute statement
    $stmt->bind_param('i', $category_id);
    $stmt->execute();

    // Get result set
    $result = $stmt->get_result();

    // Fetch data as associative array
    $recipes = [];
    while ($row = $result->fetch_assoc()) {
        $recipes[] = $row;
    }

    // Free result set
    $stmt->free_result();

    // Close statement
    $stmt->close();

    // Output JSON
    header('Content-Type: application/json');
    echo json_encode($recipes);
} else {
    // Handle case where category_id parameter is missing
    http_response_code(400); // Bad Request
    echo json_encode(array("error" => "Missing category_id parameter"));
}

// Close database connection
$conn->close();
?>
