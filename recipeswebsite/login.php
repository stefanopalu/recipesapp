<?php
// User login verification


// Database connection details
include('db_connection.php');

// Check form submission is using POST method
if($_SERVER["REQUEST_METHOD"] == "POST") {

    $username = $_POST["username"];
    $password = $_POST["password"];

    // Statement to prevent sql injection,
    // not necessary for project but I thought it was a good idea.
    
    //Select all data from user table then bind to placeholder.
    // Execute the prepared statment and get results.
    $stmt = $conn->prepare("SELECT * FROM users WHERE username = ?");
    $stmt->bind_param("s", $username);
    $stmt->execute();
    $result = $stmt->get_result();

    //Check for return rows then if user is found we will
    //verify the password entered with the stored password.
    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();
        if (password_verify($password, $row["password"])) {
            // Start login session and redirect to profilepage if
            // passed, otherwise display invalid username or password.
            session_start();
            $_SESSION['username'] = $username;
            header("Location: userprofile.html");
            exit();
        } else {
            echo "Invalid username or password";
        }
    } else {
        // If username not found display the same.
        echo "Invalid username or password";
    }

    $stmt->close();
    $result->close();

}

$conn->close();

?>
