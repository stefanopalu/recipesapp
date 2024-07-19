document.addEventListener('DOMContentLoaded', () => {
    const recipesContainer = document.getElementById('favorite-recipes-container');

    // Fetch favorite recipes
    fetch('check_favorite.php')
        .then(response => response.json())
        .then(data => {
            if (data.status === 'success') {
                // Clear any existing content
                recipesContainer.innerHTML = '';

                // Update recipe cards with favorite recipes
                updateRecipeCards(data.recipes);
            } else {
                console.error('Error fetching favorite recipes:', data.message);
                recipesContainer.innerHTML = '<p>No favorite recipes found.</p>';
            }
        })
        .catch(error => {
            console.error('Error fetching favorite recipes:', error);
            recipesContainer.innerHTML = '<p>An error occurred while fetching favorite recipes.</p>';
        });

    // Function to update recipe cards in the DOM with favorite recipes
    function updateRecipeCards(recipes) {
        console.log('Updating favorite recipe cards with data:', recipes);
        
        recipes.forEach(recipe => {
            const recipeCard = document.createElement('div');
            recipeCard.classList.add('recipe-card');

            // Create image element
            const recipeImage = document.createElement('img');
            recipeImage.classList.add('recipe-image');
            recipeImage.src = recipe.image_path;
            recipeImage.alt = recipe.recipe_name;
            
            const recipeButton = document.createElement('button');
            recipeButton.classList.add('recipe-button');
            recipeButton.dataset.recipeId = recipe.recipe_id;
            recipeButton.addEventListener('click', () => {
                window.location.href = `recipepage.html?recipe_id=${recipe.recipe_id}`;
            });

            recipeButton.appendChild(recipeImage);
            recipeCard.appendChild(recipeButton);

            const recipeTitle = document.createElement('h3');
            recipeTitle.textContent = recipe.recipe_name;
            recipeCard.appendChild(recipeTitle);

            recipesContainer.appendChild(recipeCard);
        });
    }
});
