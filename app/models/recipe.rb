class Recipe < ApplicationRecord
    has_many :ingredients
    belongs_to :user
    validate :allergy_alert

    def user_attributes=(user_attributes)
        self.user = User.find_or_create_by(name: user_attributes[:name], allergies: user_attributes[:allergies]) unless user_attributes[:name].blank?
    end

    def ingredients_attributes=(ingredients_attributes)
        ingredients_attributes.each do |i, ingredient_attributes|
            if ingredient_attributes[:name].present?
                self.ingredients.build(ingredient_attributes)
            end
        end
    end

    def self.search(search)
        if search
            array = []
            Recipe.all.each{|recipe| array << recipe if recipe.ingredients.count.to_s == search}
            if array.length > 0
                array
            else
                Recipe.all
            end
        else
            Recipe.all
        end   
    end


    def allergy_alert
        self.user.my_allergies.each do |allergy|
            self.ingredients.each do |ingredient|
                if ingredient.name.downcase.include?(allergy.downcase)
                    errors.add(:recipe, "Your User is allergic to #{allergy.pluralize.upcase}!")
                end
            end
        end
    end
end
