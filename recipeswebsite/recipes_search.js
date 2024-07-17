document.addEventListener('DOMContentLoaded', function() {
    console.log('DOM fully loaded and parsed. Ready to add event listeners.');

    // Add event listeners to category buttons
    const categoryButtons = document.querySelectorAll('.button-container button');
    
    categoryButtons.forEach(button => {
        button.addEventListener('click', function() {
            const categoryId = button.dataset.categoryId;
            console.log(`Button clicked! Category ID: ${categoryId}`);
            
            // Make GET request to get_recipes.php with category_id as parameter
            fetch(`get_recipes.php?category_id=${categoryId}`)
                .then(response => {
                    if (!response.ok) {
                        throw new Error(`Network response was not ok: ${response.status}`);
                    }
                    return response.json(); // Parse response as JSON
                })
                .then(data => {
                    console.log('Data received from get_recipes.php:', data);
                    updateRecipeCards(data);
                })
                .catch(error => {
                    console.error('Error fetching recipes:', error);
                });
        });
    });

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
            recipeButton.dataset.recipeId = recipe.recipe_id; // Store the recipe ID
            recipeButton.addEventListener('click', function() {
                window.location.href = `recipepage.html?recipe_id=${recipe.recipe_id}`;
            });

            const recipeTitle = document.createElement('h3');
            recipeTitle.textContent = recipe.recipe_name; // Replace with actual property from your JSON data
            recipeCard.appendChild(recipeTitle);

            recipeCard.appendChild(recipeButton);
            searchResultsContainer.appendChild(recipeCard);
        });
    }
});