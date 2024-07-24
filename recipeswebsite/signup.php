<?php
// Database connection details
include('db_connection.php');

// Check if the form is submitted via POST method
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Check if all expected POST keys are set
    $username = isset($_POST["username"]) ? trim($_POST["username"]) : '';
    $firstname = isset($_POST["firstname"]) ? trim($_POST["firstname"]) : '';
    $lastname = isset($_POST["lastname"]) ? trim($_POST["lastname"]) : '';
    $password = isset($_POST["password"]) ? trim($_POST["password"]) : '';
    $email = isset($_POST["email"]) ? trim($_POST["email"]) : '';

    // Validate inputs (basic validation)
    if (empty($username) || empty($firstname) || empty($lastname) || empty($password) || empty($email)) {
        die("All fields are required.");
    }

    // Check if the username already exists
    $stmt = $conn->prepare("SELECT * FROM users WHERE username = ?");
    if ($stmt === false) {
        die("Prepare failed: " . $conn->error);
    }
    $stmt->bind_param("s", $username);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        die("Username already exists.");
    }

    // Hash the password
    $hashed_password = password_hash($password, PASSWORD_DEFAULT);

    // Insert new user into the database
    $stmt = $conn->prepare("INSERT INTO users (username, firstname, lastname, password, email) VALUES (?, ?, ?, ?, ?)");
    if ($stmt === false) {
        die("Prepare failed: " . $conn->error);
    }
    $stmt->bind_param("sssss", $username, $firstname, $lastname, $hashed_password, $email);

    if ($stmt->execute()) {
        echo "Signup successful! You can now <a href='#loginForm'>login</a>.";
    } else {
        die("Error: " . $stmt->error);
    }

    // Close statement and connection
    $stmt->close();
    $conn->close();
}
?>

