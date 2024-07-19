document.addEventListener('DOMContentLoaded', () => {
    const loginButton = document.getElementById('loginButton');
    const logoutButton = document.getElementById('logoutButton');

    // Check if user is logged in
    fetch('check_session.php')
        .then(response => response.json())
        .then(data => {
            if (data.status === 'success') {
                // User is logged in
                loginButton.style.display = 'none'; // Hide login button
                logoutButton.style.display = 'inline'; // Show logout button
            } else {
                // User is not logged in
                loginButton.style.display = 'inline'; // Show login button
                logoutButton.style.display = 'none'; // Hide logout button
            }
        })
        .catch(error => {
            console.error('Error checking session:', error);
        });

    // Handle logout button click
    if (logoutButton) {
        logoutButton.addEventListener('click', () => {
            fetch('logout.php')
                .then(response => response.text())
                .then(data => {
                    if (data === 'success') {
                        window.location.href = 'index.html'; // Redirect to homepage on successful logout
                    } else {
                        alert('Logout failed: ' + data);
                    }
                })
                .catch(error => {
                    console.error('Error logging out:', error);
                    alert('An error occurred. Please try again.');
                });
        });
    }

});
