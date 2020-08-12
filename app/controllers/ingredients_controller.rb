class IngredientsController < ApplicationController
    def index
        @ingredients = Ingredient.all
    end

    def show
        @this_ingredient_array = Ingredient.all.where(name: params[:name])
    end
end
