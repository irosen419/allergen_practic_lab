class User < ApplicationRecord
    has_many :recipes

    def my_allergies
        self.allergies.split(", ") if self.allergies
    end
end
