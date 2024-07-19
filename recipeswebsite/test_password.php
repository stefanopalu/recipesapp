<?php
// Test password hashing and verification

// Define the password and hash
$password = '123456'; // The password you want to verify
$hashed_password = '$2y$10$qS70rFXpaDhuMR6yjjZkxe92FueDyaL3xgufuk9qC4Cp8P1HaD0IW'; // Example hash from your database

// Display the hashed password
echo "Stored Hash: " . $hashed_password . "<br>";

// Verify the password
if (password_verify($password, $hashed_password)) {
    echo "Password verified successfully!";
} else {
    echo "Password verification failed.";
}
?>
