// Javascript for User Login


//Select login form, submit button and add event for
//login form.
const loginForm = document.getElementById('loginForm');
const loginButton = loginForm.querySelector('button');

loginForm.addEventListener('submit', (event) => {
    event.preventDefault(); //Prevent default form submission behavior

    //Extract username and password
    const username = loginForm.username.value;
    const password = loginForm.password.value;

    //Ensure username and password are entered or alert user
    if (!username || !password) {
        alert('Please enter your username and password.');
        return;
    }

    fetch('login.php', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded' //Data sent is suitable for form submissions.
        },
        body: `username=${username}&password=${password}`
    })
        //Login response from the login.php.
        // If login successful we will go to userprofile.html,
        //if not error message will come up.
        .then(response => response.text())
        .then(data => {
            if (data === 'success') {
                window.location.href = 'userprofile.html';
            } else {
                alert(data);
            }
        })
        .catch(error => {
            console.error('Error', error);
            alert('Error occurrd. Try again.');
        });
})