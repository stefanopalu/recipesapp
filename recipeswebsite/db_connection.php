<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "recipesdb";
$port="3306";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname, $port);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
echo "Connected Successfully!";

?>
