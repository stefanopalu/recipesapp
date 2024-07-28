# Recipe Web Application

## Overview

This project is a server-side web application designed to provide a user-friendly platform to share recipes. The application is developed using PHP, HTML5, CSS3, and JavaScript, and stores data in a MySQL relational database.

## Features

- **User Management**: Register, log in, and manage user profiles.
- **Recipe Management**: View, search, and rate recipes.
- **Favorites**: Save and manage favorite recipes.
- **Responsive Design**: Accessible across different devices.

## Database Design

In developing our recipe web application, the first step was designing the database to efficiently store and manage various aspects of the recipes, users, ingredients, and interactions such as ratings and favorites. The schema is normalized to ensure data integrity and efficiency.

- **recipes**: Contains details about each recipe such as name, description, cooking and preparation time, and step-by-step instructions.
  - `recipe_id` (INT, primary key)
  - `recipe_name` (TEXT)
  - `description` (TEXT)
  - `preparation_time` (TEXT)
  - `cooking_time` (TEXT)
  - `instructions_steps` (LONGTEXT, JSON format)
  - `category_id` (INT, foreign key referencing `categories`)
  - `avg_rating` (INT)
  - `image_path` (VARCHAR)

- **ingredients**: Stores all ingredients to avoid duplication and maintain consistency.
  - `ingredient_id` (INT, primary key)
  - `ingredient_name` (VARCHAR)

- **recipe_ingredients**: Links recipes and ingredients, storing the ingredients used in each recipe along with their quantities.
  - `recipe_ingredient_id` (INT, primary key)
  - `recipe_id` (INT, foreign key referencing `recipes`)
  - `ingredient_id` (INT, foreign key referencing `ingredients`)
  - `quantity` (VARCHAR)

- **users**: Stores essential user information.
  - `user_id` (INT, primary key)
  - `username` (VARCHAR)
  - `firstname` (VARCHAR)
  - `lastname` (VARCHAR)
  - `email` (VARCHAR)
  - `password` (VARCHAR)

- **ratings**: Manages user ratings through a junction table that links each user to the recipes they have rated.
  - `rating_id` (INT, primary key)
  - `recipe_id` (INT, foreign key referencing `recipes`)
  - `user_id` (INT, foreign key referencing `users`)
  - `rating` (INT)

- **favorites**: Manages users’ favorite recipes, ensuring each user’s preferences are stored and easily accessible.
  - `favorite_id` (INT, primary key)
  - `recipe_id` (INT, foreign key referencing `recipes`)
  - `user_id` (INT, foreign key referencing `users`)

- **categories**: Stores different categories of recipes.
  - `category_id` (INT, primary key)
  - `category_name` (VARCHAR)

## Recipe Display

The `recipepage.html` file defines the structure of the recipe page, while all its elements are dynamically populated with data retrieved from the server. 

- **Backend**:
  - `get_recipe_details.php`: Fetches detailed recipe information from the database. Retrieves data based on the `recipe_id` parameter and collects details such as the recipe’s name, description, preparation and cooking times, instructions, image path, and average rating. Also gathers the recipe’s ingredients from the corresponding table. Encodes data in JSON format and sends it back to the client.

- **Client-side**:
  - `recipepage.js`: Dynamically updates the recipe page. Extracts the `recipe_id` from the URL and makes an AJAX request to `get_recipe_details.php`. Processes the JSON response to populate all the recipe’s details through the `updateRecipe` function. Manages interactive elements such as rating and favoriting. Ratings are sent to the server via `save_rating.php`, and favorite status updates are managed through `save_favorite.php`.

## Recipe Search

The `recipesearch.html` file is divided into sections for selecting categories, ingredients, and cooking times, and a container for displaying search results. 

- **Backend**:
  - `get_recipes.php`: Fetches recipes based on the selected search criteria from the database. Processes parameters received via a GET request, sanitizes them, and constructs a SQL query to match the combined criteria using prepared statements. Returns the recipes as an associative array.

- **Client-side**:
  - `recipessearch.js`: Handles the dynamic aspects of the recipe search page. Attaches event listeners to update the search criteria when a button is clicked. Makes an AJAX request to `get_recipes.php` using the `fetchRecipes` function. Processes the JSON response to update the search results on the page. Manages the selection state of buttons, ensuring the displayed search results always correspond to the current combination of selected criteria.

## User Management System

The homepage, `index.html`, facilitates both login and sign-up functionalities. 

- **Client-side**:
  - `login.js`: Manages the login form submissions. Sends credentials to the server via a POST request to `login.php`. Redirects the user to their profile page upon successful login or displays an error message if login fails.
  - `signup.js`: Handles user registration. Sends user details to `signup.php` for processing. Provides feedback based on the server's response.
  - `session.js`: Manages user session visibility and interaction across the site. Checks the user’s login status and adjusts the display of navigation bar buttons accordingly. Handles logout functionality by making a request to `logout.php`.

- **Server-side**:
  - `login.php`: Processes login attempts by verifying credentials against the database. Starts a session and sets session variables for user identification if successful.
  - `signup.php`: Handles user registration by ensuring the username does not already exist. Hashes the password before storing it and returns a confirmation message upon successful registration.
  - `check_session.php`: Verifies whether a user is logged in and returns a JSON response indicating the login status.
  - `check_favorite.php`: Verifies that the user is logged in and queries the database to get the recipes marked as favorites by the user.

## Styling

The application uses CSS variables for defining the color palette, allowing easy updates of the color scheme across the entire application without altering individual style declarations. Reusable CSS classes are employed to apply common styles efficiently, ensuring visual consistency and simplifying the process of implementing design changes and maintaining the application. The layout is crafted with a responsive design approach, making use of flexbox and grid systems to ensure the application is functional across different devices.

## Setup Instructions

1. **Environment Setup**:
   - Install XAMPP (Apache, MySQL, PHP) and Visual Studio Code.
   - Ensure PHP (version 7 or 8) is installed and configured.

2. **Database Setup**:
   - Use MySQL Workbench to create the database and tables.
   - Import sample data from `recipesdb.sql`.

3. **Project Deployment**:
   - Clone or download the project repository.
   - Place the project folder in the XAMPP `htdocs` directory.
   - Start the Apache and MySQL services using the XAMPP control panel.

4. **Configuration**:
   - Update database configuration settings in `db_connection.php` to match your local setup.

## Usage Guide

### Registration and Login

- Navigate to the homepage (`index.html`).
- Use the provided forms to register or log in.

### Searching for Recipes

- Use the search page (`recipessearch.html`) to search for recipes based on categories, ingredients, and cooking times.
- Results are dynamically updated and displayed as recipe cards.

### Viewing and Managing Recipes

- Click on a recipe card to view detailed information about the recipe.
- Use the favorite button to save recipes to your profile.
