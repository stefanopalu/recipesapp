<?php
$password = '123456';
$stored_hash = '$2y$10$qS70rFXpaDhuMR6yjjZkxe92FueDyaL3xgufuk9qC4Cp8P1HaD0IW';

if (password_verify($password, $stored_hash)) {
    echo "Password is valid!";
} else {
    echo "Invalid password.";
}
?>