<?php

// Set server credentials here
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "Groupwork";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
?>
