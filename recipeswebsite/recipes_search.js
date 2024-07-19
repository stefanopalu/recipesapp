document.addEventListener('DOMContentLoaded', function() {
    console.log('DOM fully loaded and parsed. Ready to add event listeners.');

    // Add event listeners to category buttons
    const categoryButtons = document.querySelectorAll('.category-buttons .button-container button');
    
    categoryButtons.forEach(button => {
        button.addEventListener('click', function() {
            const categoryId = button.dataset.categoryId;
            console.log(`Button clicked! Category ID: ${categoryId}`);
            
            fetchRecipes(`category_id=${categoryId}`)
                .then(data => {
                    console.log('Data received from get_recipes.php:', data);
                    updateRecipeCards(data);
                })
                .catch(error => {
                    console.error('Error fetching recipes:', error);
                });
        });
    });

    // Add event listeners to ingredient buttons
    const ingredientButtons = document.querySelectorAll('.ingredient-buttons .button-container button');

    ingredientButtons.forEach(button => {
        button.addEventListener('click', function() {
            const ingredientId = button.dataset.ingredientId;
            console.log(`Button clicked! Ingredient ID: ${ingredientId}`);
            
            fetchRecipes(`ingredient_id=${ingredientId}`)
                .then(data => {
                    console.log('Data received from get_recipes.php:', data);
                    updateRecipeCards(data);
                })
                .catch(error => {
                    console.error('Error fetching recipes by ingredient:', error);
                });
        });
    });

    /// Function to fetch recipes by category or ingredient
    function fetchRecipes(params) {
        return fetch(`get_recipes.php?${params}`)
            .then(response => {
                if (!response.ok) {
                    throw new Error(`Network response was not ok: ${response.status}`);
                }
                return response.json(); // Parse response as JSON
            });
    }

    // Function to update search results in the DOM with recipe cards
    function updateRecipeCards(recipes) {
        console.log('Updating recipe cards with data:', recipes);
        
        const searchResultsContainer = document.querySelector('.search-results');
        searchResultsContainer.innerHTML = ''; // Clear previous results


        recipes.forEach(recipe => {
            const recipeCard = document.createElement('div');
            recipeCard.classList.add('recipe-card');

            const recipeButton = document.createElement('button');
            recipeButton.classList.add('recipe-button');
            recipeButton.dataset.recipeId = recipe.recipe_id;
            recipeButton.addEventListener('click', function() {
                window.location.href = `recipepage.html?recipe_id=${recipe.recipe_id}`;
            });

            // Create image element
            const recipeImage = document.createElement('img');
            recipeImage.classList.add('recipe-image');
            recipeImage.src = recipe.image_path;
            recipeImage.alt = recipe.recipe_name;
            recipeButton.appendChild(recipeImage);

            const recipeTitle = document.createElement('h3');
            recipeTitle.textContent = recipe.recipe_name; // Replace with actual property from your JSON data
            recipeCard.appendChild(recipeTitle);

            recipeCard.appendChild(recipeButton);
            searchResultsContainer.appendChild(recipeCard);
        });
    }
});