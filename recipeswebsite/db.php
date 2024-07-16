<?php

error_reporting(E_ALL);
ini_set('display_errors', 1);

$servername = "localhost";
$username = "root";
$password = "";
$dbname = "recipesdb";
$port="3307";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname, $port);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
} else {
    echo "Connected successfully";
}

// Example query to select all users
$sql = "SELECT * FROM users";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    // Output data of each row
    while($row = $result->fetch_assoc()) {
        echo "User ID: " . $row["user_id"]. "<br>";
        echo "Username: " . $row["username"]. "<br>";
        echo "Name: " . $row["firstname"]. " " . $row["lastname"]. "<br>";
        echo "Email: " . $row["email"]. "<br>";
        echo "<hr>";
    }
} else {
    echo "0 results";
}

// Close connection
$conn->close();

?>
