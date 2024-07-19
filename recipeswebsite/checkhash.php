<?php
include('db_connection.php');

// Query to select all user records
$sql = "SELECT username, password FROM users"; // Adjust table and column names as needed
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {
        $username = $row["username"];
        $password = $row["password"];

        // Check if the password is hashed (bcrypt hashes have a length of 60 characters)
        if (strlen($password) === 60 && preg_match('/^\$2y\$/', $password)) {
            echo "Username: $username - Password is hashed.<br>";
        } else {
            echo "Username: $username - Password is NOT hashed.<br>";
        }
    }
} else {
    echo "0 results";
}

$conn->close();
?>