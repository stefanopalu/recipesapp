document.addEventListener('DOMContentLoaded', function() {
    // Function to get query parameter value by name
    function getQueryParameter(name) {
        const urlParams = new URLSearchParams(window.location.search);
        return urlParams.get(name);
    }

    const recipeId = getQueryParameter('recipe_id');

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

        } else {
            console.error('No recipe data received');
        }
    }
});
