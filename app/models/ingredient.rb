class Ingredient < ApplicationRecord
    belongs_to :recipe

    def self.uniq_ingredients
        Ingredient.all.map{|ingredient| ingredient.name.downcase}.uniq
    end

    def self.allergies_by_number
        a = User.all.map{|user| user.allergies.split(", ") if user.allergies}.compact.flatten
        b = a.concat(self.uniq_ingredients)
        b.each_with_object(Hash.new) do |index, hash|
            if hash[index] 
                hash[index] += 1
            else
                hash[index] = 1
            end
        end
    end

    def self.sorted
        self.allergies_by_number.sort_by{|k, v| v}.reverse.to_h
    end
end
