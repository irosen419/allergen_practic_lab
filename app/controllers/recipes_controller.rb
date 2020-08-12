class RecipesController < ApplicationController

    def index
        @recipes = Recipe.search(params[:search])
    end

    def show
        @recipe = Recipe.find(params[:id])
    end

    def new
        @recipe = Recipe.new
        @recipe.ingredients.build(:ingredient_number => "1")
        @recipe.ingredients.build(:ingredient_number => "2")
        @recipe.ingredients.build(:ingredient_number => "3")
    end

    def create
        @recipe = Recipe.create(recipe_params)
        if @recipe.valid?
            redirect_to recipe_path(@recipe)
        else
            flash[:errors] = @recipe.errors.full_messages
            redirect_to new_recipe_path(@recipe)
        end
    end

    private

    def recipe_params
        params.require(:recipe).permit(:name, :user_id, :search, :ingredients_attributes => [:name, :quantity, :ingredient_number], :user_attributes => [:name, :allergies])
    end
end
