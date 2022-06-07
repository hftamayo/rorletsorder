class Meal < ApplicationRecord

    def as_json(options = {})
        super(:only => [:id, :name, :description, :price])
    end
    
end
