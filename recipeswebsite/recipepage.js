document.addEventListener('DOMContentLoaded', function() {
    function getQueryParameter(name) {
        const urlParams = new URLSearchParams(window.location.search);
        return urlParams.get(name);
    }

    const recipeId = getQueryParameter('recipe_id');
    const favoriteIcon = document.getElementById('favorite-icon');
    const averageRatingElement = document.getElementById('average-rating');
    const stars = document.querySelectorAll('.rating-star');

    if (recipeId) {
        // Fetch and update recipe details
        fetch(`get_recipe_details.php?recipe_id=${recipeId}`)
            .then(response => response.json())
            .then(data => updateRecipeDetails(data))
            .catch(error => console.error('Error fetching recipe details:', error));

        // Check if the recipe is already in favorites
        fetch(`check_favorite.php?recipe_id=${recipeId}`)
            .then(response => response.json())
            .then(data => updateFavoriteIcon(data))
            .catch(error => console.error('Error checking favorite status:', error));

        // Fetch and display the current rating
        fetch(`get_recipe_rating.php?recipe_id=${recipeId}`)
            .then(response => response.json())
            .then(data => {
                if (data.status === 'success') {
                    averageRatingElement.textContent = data.rating_text;
                    setInitialRating(data.rating);
                } else {
                    console.error('Error fetching rating:', data.message);
                }
            })
            .catch(error => {
                console.error('Error fetching rating:', error);
            });

        // Set up event listeners for stars
        stars.forEach(star => {
            star.addEventListener('click', setRating);
            star.addEventListener('mouseover', addHover);
            star.addEventListener('mouseout', removeHover);
        });
    } else {
        console.error('No recipe_id found in the URL');
    }

    function updateRecipeDetails(recipe) {
        if (recipe) {
            document.getElementById('recipe-title').textContent = recipe.recipe_name;
            document.getElementById('recipe-description').textContent = recipe.description;
            document.getElementById('prep-time').textContent = recipe.prep_time;
            document.getElementById('cook-time').textContent = recipe.cook_time;

            const recipeImage = document.getElementById('recipe-image');
            recipeImage.src = recipe.image_path;

            const ingredientsList = document.getElementById('ingredients-list');
            ingredientsList.innerHTML = '';
            recipe.ingredients.forEach(ingredient => {
                const li = document.createElement('li');
                li.textContent = `${ingredient.ingredient_name} ${ingredient.quantity}`;
                ingredientsList.appendChild(li);
            });

            const cookingStepsList = document.getElementById('cooking-steps-list');
            cookingStepsList.innerHTML = '';
            let cookingSteps = recipe.instructions_steps;
            if (Array.isArray(cookingSteps) && cookingSteps.length === 1) {
                cookingSteps = JSON.parse(cookingSteps[0]);
            }
            if (Array.isArray(cookingSteps)) {
                cookingSteps.forEach(step => {
                    const li = document.createElement('li');
                    li.textContent = step.trim();
                    cookingStepsList.appendChild(li);
                });
            } else {
                console.error('No cooking steps found in the recipe data');
            }

            if (favoriteIcon) {
                favoriteIcon.addEventListener('click', toggleFavorite);
            }
        } else {
            console.error('No recipe data received');
        }
    }

    function updateFavoriteIcon(data) {
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
    }

    function updateRatingDisplay(data) {
        if (data.status === 'success') {
            setInitialRating(data.rating);
            if (data.rating > 0) {
                averageRatingElement.textContent = `You were the first to rate this recipe!`;
            } else {
                averageRatingElement.textContent = `No user ratings yet. Be the first to rate this recipe!`;
            }
        } else {
            console.error('Error fetching rating:', data.message);
        }
    }

    function setInitialRating(rating) {
        stars.forEach(star => {
            if (star.getAttribute('data-value') <= rating) {
                star.classList.add('filled');
            } else {
                star.classList.remove('filled');
            }
        });
    }

    function setRating(event) {
        const rating = event.target.getAttribute('data-value');
        const userId = getUserId(); // Implement this function to retrieve the user ID
    
        stars.forEach(star => {
            if (star.getAttribute('data-value') <= rating) {
                star.classList.add('filled');
            } else {
                star.classList.remove('filled');
            }
        });
    
        fetch('save_rating.php', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded'
            },
            body: `recipeId=${recipeId}&userId=${userId}&rating=${rating}`
        })
        .then(response => response.json())
        .then(data => {
            if (data.status === 'success') {
                averageRatingElement.textContent = 'Rating saved successfully!';
            } else {
                alert('Failed to save rating: ' + data.message);
            }
        })
        .catch(error => {
            console.error('Error saving rating:', error);
            alert('An error occurred. Please try again.');
        });
    }    

    function addHover(event) {
        const rating = event.target.getAttribute('data-value');
        stars.forEach(star => {
            if (star.getAttribute('data-value') <= rating) {
                star.classList.add('filled');
            }
        });
    }

    function removeHover(event) {
        const rating = document.querySelector('.rating-star.filled:last-of-type')?.getAttribute('data-value') || 0;
        stars.forEach(star => {
            if (star.getAttribute('data-value') > rating) {
                star.classList.remove('filled');
            }
        });
    }

    function toggleFavorite() {
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
    }
});
