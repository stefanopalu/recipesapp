// JavaScript for User Sign-Up

document.addEventListener('DOMContentLoaded', () => {
    const signupForm = document.getElementById('signupForm');
    const loginFormSection = document.getElementById('loginFormSection');
    const signupFormSection = document.getElementById('signupFormSection');
    const showLoginLink = document.getElementById('showLogin');

    if (signupForm) {
        signupForm.addEventListener('submit', (event) => {
            event.preventDefault(); // Prevent default form submission

            const username = signupForm.username.value;
            const firstname = signupForm.firstname.value;
            const lastname = signupForm.lastname.value;
            const password = signupForm.password.value;
            const email = signupForm.email.value;

            if (!username || !firstname || !lastname || !password || !email) {
                alert('Please fill in all fields.');
                return;
            }

            fetch('signup.php', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded',
                },
                body: `username=${encodeURIComponent(username)}&firstname=${encodeURIComponent(firstname)}&lastname=${encodeURIComponent(lastname)}&password=${encodeURIComponent(password)}&email=${encodeURIComponent(email)}`
            })
                .then(response => response.text())
                .then(data => {
                    alert(data); // Show signup result message
                    if (data.includes('Signup successful')) {
                        // Optionally, redirect or switch to the login form
                        loginFormSection.style.display = 'block';
                        signupFormSection.style.display = 'none';
                    }
                })
                .catch(error => {
                    console.error('Error:', error);
                    alert('An error occurred. Please try again.');
                });
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
});
