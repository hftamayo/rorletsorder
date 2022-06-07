class Meal < ApplicationRecord

    def as_json(options = {})
        super(:only => [:name, :description, :price])
    end
end
