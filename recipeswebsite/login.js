// JavaScript for User Login and Profile Population

document.addEventListener('DOMContentLoaded', () => {
    const loginForm = document.getElementById('loginForm');
    const signupForm = document.getElementById('signupForm');
    const loginFormSection = document.getElementById('loginFormSection');
    const signupFormSection = document.getElementById('signupFormSection');
    const showSignupLink = document.getElementById('showSignup');
    const showLoginLink = document.getElementById('showLogin');
    const profileContainer = document.querySelector('.profile-container');

    // Handle login form submission
    if (loginForm) {
        loginForm.addEventListener('submit', (event) => {
            event.preventDefault(); // Prevent default form submission behavior

            // Extract username and password
            const username = loginForm.querySelector('#username').value;
            const password = loginForm.querySelector('#password').value;

            // Ensure username and password are entered or alert user
            if (!username || !password) {
                alert('Please enter your username and password.');
                return;
            }

            fetch('login.php', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded' // Data sent is suitable for form submissions
                },
                body: `username=${encodeURIComponent(username)}&password=${encodeURIComponent(password)}`
            })
            .then(response => response.text())
            .then(data => {
                if (data === 'success') {
                    window.location.href = 'userprofile.html'; // Redirect to profile page on successful login
                } else {
                    alert('Login failed: ' + data); // Show server error message
                }
            })
            .catch(error => {
                console.error('Error:', error);
                alert('An error occurred. Try again.');
            });
        });
    }

    // Show signup form and hide login form
    if (showSignupLink) {
        showSignupLink.addEventListener('click', (event) => {
            event.preventDefault(); // Prevent default link behavior
            loginFormSection.style.display = 'none';
            signupFormSection.style.display = 'block';
        });
    }

    // Show login form and hide signup form
    if (showLoginLink) {
        showLoginLink.addEventListener('click', (event) => {
            event.preventDefault(); // Prevent default link behavior
            signupFormSection.style.display = 'none';
            loginFormSection.style.display = 'block';
        });
    }

    // Handle profile data population if on the profile page
    if (profileContainer) {
        fetch('get_user_data.php')
            .then(response => response.json())
            .then(data => {
                if (data.status === 'success') {
                    document.getElementById('username').textContent = data.userData.username;
                    document.getElementById('firstname').textContent = data.userData.firstname;
                    document.getElementById('lastname').textContent = data.userData.lastname;
                    document.getElementById('email').textContent = data.userData.email;
                } else {
                    console.log('Error:', data.message);
                    // Handle errors or redirect if not logged in
                    alert('Error loading user data: ' + data.message);
                }
            })
            .catch(error => {
                console.error('Error:', error);
            });
    }
});
