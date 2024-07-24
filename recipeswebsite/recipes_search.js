document.addEventListener('DOMContentLoaded', function() {
    console.log('DOM fully loaded and parsed. Ready to add event listeners.');

    // Variable to store selected criteria
    const selectedCriteria = {
        categoryId: null,
        ingredientIds: [],
        cookingTimeId: null
    };

    // Function to update the selected criteria and fetch recipes
    function updateCriteria(key, value, isRemoval) {
        console.log(`Updating criteria: ${key} with value: ${value}`);
        if (key === 'ingredientIds') {
            if (isRemoval) {
                // If removing an ingredient, delete it from the array
                selectedCriteria[key] = selectedCriteria[key].filter(id => id !== value);
            } else {
                // If adding an ingredient, add it into the array if not already present
                if (!selectedCriteria[key].includes(value)) {
                    selectedCriteria[key].push(value);
                }
            }
            // Ensure no duplicate values
            selectedCriteria[key] = [...new Set(selectedCriteria[key])];
        } else {
            selectedCriteria[key] = value;
        }
        console.log('Selected criteria after update:', selectedCriteria);

        const allCriteriaCleared = (
            (selectedCriteria.categoryId === null || selectedCriteria.categoryId === '') &&
            (selectedCriteria.cookingTimeId === null || selectedCriteria.cookingTimeId === '') &&
            selectedCriteria.ingredientIds.length === 0
        );
    
        if (allCriteriaCleared) {
            // If all criteria are empty, reset search results
            updateRecipeCards([]); 
        } else {
            // Call function to fetch recipes with current criteria
            fetchRecipes(selectedCriteria)
                .then(data => {
                    console.log('Data received from get_recipes.php:', data);
                    updateRecipeCards(data);
                })
                .catch(error => {
                    console.error('Error fetching recipes:', error);
                });
        }
    }

    // Add event listeners to category buttons
    const categoryButtons = document.querySelectorAll('.category-buttons .button-container button');
    categoryButtons.forEach(button => {
        button.addEventListener('click', function() {
            const categoryId = button.dataset.categoryId;
            const isSelected = button.classList.contains('selected');

            if (!isSelected) {
                categoryButtons.forEach(btn => btn.classList.remove('selected'));
                button.classList.add('selected');
                updateCriteria('categoryId', categoryId);
            } else {
                button.classList.remove('selected');
                updateCriteria('categoryId', null); // Clear the category criteria
            }    
        });
    });

    // Add event listeners to ingredient buttons
    const ingredientButtons = document.querySelectorAll('.ingredient-buttons .button-container button');
    ingredientButtons.forEach(button => {
        button.addEventListener('click', function() {
            const ingredientId = button.dataset.ingredientId;
            const isSelected = button.classList.contains('selected');

        if (isSelected) {
            // If selected, remove the button from selected state
            button.classList.remove('selected');
            updateCriteria('ingredientIds', ingredientId, true);
        } else {
            // If not selected, add the button to selected state
            button.classList.add('selected');
            updateCriteria('ingredientIds', ingredientId, false);
        }
        });
    });

    // Add event listeners to cooking time buttons
    const cookingTimeButtons = document.querySelectorAll('.time-buttons .button-container button');
    cookingTimeButtons.forEach(button => {
        button.addEventListener('click', function() {
            const timeId = button.dataset.timeId;
            const isSelected = button.classList.contains('selected');

            if (!isSelected) {
                cookingTimeButtons.forEach(btn => btn.classList.remove('selected'));
                button.classList.add('selected');
                updateCriteria('cookingTimeId', timeId);
            } else {
                button.classList.remove('selected');
                updateCriteria('cookingTimeId', null); // Clear the cooking time criteria
            }
        });
    });
    
    // Function to fetch recipes based on selected criteria
    function fetchRecipes(criteria) {
        const params = new URLSearchParams();
        if (criteria.categoryId) params.append('category_id', criteria.categoryId);
        if (criteria.ingredientIds.length > 0) params.append('ingredient_ids', criteria.ingredientIds.join(','));
        if (criteria.cookingTimeId) params.append('cooking_time', criteria.cookingTimeId);

        return fetch(`get_recipes.php?${params.toString()}`)
            .then(response => response.json());
    }

    // Function to update recipe cards
    function updateRecipeCards(recipes) {
        console.log('Updating recipe cards with data:', recipes);
        const searchResultsContainer = document.querySelector('.search-results');
        searchResultsContainer.innerHTML = '';

        if (recipes.length === 0) {
            const noResultsMessage = document.createElement('h3');
            noResultsMessage.textContent = 'No recipes found.';
            searchResultsContainer.appendChild(noResultsMessage);
        } else {
            // Create recipe card for each recipe that match criteria
            recipes.forEach(recipe => {
                const recipeCard = document.createElement('div');
                recipeCard.classList.add('recipe-card');

                const recipeButton = document.createElement('button');
                recipeButton.classList.add('recipe-button');
                recipeButton.dataset.recipeId = recipe.recipe_id;
                recipeButton.addEventListener('click', function() {
                    window.location.href = `recipepage.html?recipe_id=${recipe.recipe_id}`;
                });

                const recipeImage = document.createElement('img');
                recipeImage.classList.add('recipe-image');
                recipeImage.src = recipe.image_path;
                recipeImage.alt = recipe.recipe_name;
                recipeButton.appendChild(recipeImage);

                const recipeTitle = document.createElement('h3');
                recipeTitle.textContent = recipe.recipe_name;
                recipeCard.appendChild(recipeButton);
                recipeCard.appendChild(recipeTitle);

                searchResultsContainer.appendChild(recipeCard);
            });
        }
    }
});