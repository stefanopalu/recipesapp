document.addEventListener('DOMContentLoaded', () => {
    const loginButton = document.getElementById('loginButton');
    const logoutButton = document.getElementById('logoutButton');
    const profileLink = document.getElementById('profileLink'); 

    // Check if user is logged in
    fetch('check_session.php')
        .then(response => response.json())
        .then(data => {
            if (data.status === 'success') {
                // User is logged in
                loginButton.style.display = 'none'; // Hide login button
                logoutButton.style.display = 'inline'; // Show logout button

                // Check if current page is the profile page
                if (window.location.pathname.includes('userprofile.html')) {
                    if (profileLink) {
                        profileLink.style.display = 'none'; // Hide profile link if on the profile page
                    }
                } else {
                    if (profileLink) {
                        profileLink.style.display = 'inline'; // Show profile link if not on the profile page
                    }
                }
                
            } else {
                // User is not logged in
                loginButton.style.display = 'inline'; // Show login button
                logoutButton.style.display = 'none'; // Hide logout button
                profileLink.style.display = 'none'; // Hide profile link
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
