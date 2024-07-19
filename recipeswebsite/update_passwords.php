<?php

error_reporting(E_ALL);
ini_set('display_errors', 1);

// Database connection details
include('db_connection.php');

// Select all users
$sql = "SELECT user_id, username, password FROM users";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {
        $id = $row['id'];
        $plain_password = $row['password']; // Assuming these are plain text passwords

        // Hash the password
        $hashed_password = password_hash($plain_password, PASSWORD_DEFAULT);

        // Update the user with the hashed password
        $update_stmt = $conn->prepare("UPDATE users SET password = ? WHERE user_id = ?");
        $update_stmt->bind_param("si", $hashed_password, $id);

        if ($update_stmt->execute()) {
            echo "Password for user ID $id updated successfully!<br>";
        } else {
            echo "Error updating password for user ID $id: " . $update_stmt->error . "<br>";
        }

        $update_stmt->close();
    }
} else {
    echo "No users found!";
}