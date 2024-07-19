document.addEventListener('DOMContentLoaded', function() {
    // Function to get query parameter value by name
    function getQueryParameter(name) {
        const urlParams = new URLSearchParams(window.location.search);
        return urlParams.get(name);
    }

    const recipeId = getQueryParameter('recipe_id');
    const favoriteIcon = document.getElementById('favorite-icon');

    if (recipeId) {
        fetch(`get_recipe_details.php?recipe_id=${recipeId}`)
            .then(response => {
                if (!response.ok) {
                    throw new Error(`Network response was not ok: ${response.status}`);
                }
                return response.json(); // Parse response as JSON
            })
            .then(data => {
                console.log('Data received from get_recipe_details.php:', data);
                updateRecipeDetails(data);
            })
            .catch(error => {
                console.error('Error fetching recipe details:', error);
            });

        // Check if the recipe is already in favorites
        fetch(`check_favorite.php?recipe_id=${recipeId}`)
        .then(response => {
            if (!response.ok) {
                throw new Error(`Network response was not ok: ${response.status}`);
            }
            return response.json(); // Parse response as JSON
        })
        .then(data => {
            if (data.status === 'success') {
                if (data.favorited) {
                    favoriteIcon.classList.remove('far', 'fa-heart');
                    favoriteIcon.classList.add('fas', 'fa-heart', 'favorited');
                } else {
                    favoriteIcon.classList.remove('fas', 'fa-heart', 'favorited');
                    favoriteIcon.classList.add('far', 'fa-heart');
                }
            } else {
                console.error('Error checking favorite status:', data.message);
            }
        })
        .catch(error => {
            console.error('Error checking favorite status:', error);
        });
    } else {
        console.error('No recipe_id found in the URL');
    }

    // Function to update the recipe details on the page
    function updateRecipeDetails(recipe) {
        if (recipe) {
            document.getElementById('recipe-title').textContent = recipe.recipe_name;
            document.getElementById('recipe-description').textContent = recipe.description;
            document.getElementById('prep-time').textContent = recipe.prep_time;
            document.getElementById('cook-time').textContent = recipe.cook_time;

            // Set recipe image
            const recipeImage = document.getElementById('recipe-image');
            recipeImage.src = recipe.image_path; // Assuming recipe-image is the ID of your <img> element

            // Check if cooking_steps is a JSON string within an array
            let cookingSteps = recipe.instructions_steps;
            if (Array.isArray(cookingSteps) && cookingSteps.length === 1) {
                // Parse the JSON string inside the array
                cookingSteps = JSON.parse(cookingSteps[0]);
            }

            // Populate ingredients
            const ingredientsList = document.getElementById('ingredients-list');
            ingredientsList.innerHTML = ''; // Clear any existing content
            recipe.ingredients.forEach(ingredient => {
                const li = document.createElement('li');
                li.textContent = `${ingredient.ingredient_name} ${ingredient.quantity}`;
                ingredientsList.appendChild(li);
            });

            // Populate cooking steps
            const cookingStepsList = document.getElementById('cooking-steps-list');
            cookingStepsList.innerHTML = ''; // Clear any existing content

            if (Array.isArray(cookingSteps)) {
                cookingSteps.forEach(step => {
                    const li = document.createElement('li');
                    li.textContent = step.trim(); // Trim any leading/trailing whitespace
                    cookingStepsList.appendChild(li);
                });
            } else {
                console.error('No cooking steps found in the recipe data');
            }

            if (favoriteIcon) {
                favoriteIcon.addEventListener('click', () => {
                    const isFavorited = favoriteIcon.classList.contains('favorited');
        
                    fetch('save_favorite.php', {
                        method: 'POST',
                        headers: {
                            'Content-Type': 'application/x-www-form-urlencoded'
                        },
                        body: `recipeId=${recipeId}&favorited=${!isFavorited}`
                    })
                    .then(response => response.text())
                    .then(data => {
                        if (data === 'success') {
                            if (isFavorited) {
                                favoriteIcon.classList.remove('fas', 'fa-heart', 'favorited');
                                favoriteIcon.classList.add('far', 'fa-heart');
                            } else {
                                favoriteIcon.classList.remove('far', 'fa-heart');
                                favoriteIcon.classList.add('fas', 'fa-heart', 'favorited');
                            }
                        } else {
                            alert('Failed to update favorite status: ' + data);
                        }
                    })
                    .catch(error => {
                        console.error('Error updating favorite status:', error);
                        alert('An error occurred. Please try again.');
                    });
                });
            }
        } else {
            console.error('No recipe data received');
        }
    }
});
