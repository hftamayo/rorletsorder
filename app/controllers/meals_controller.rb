class MealsController < ApplicationController
    #get /meals
    def index
        @meals = Meal.all
        render json: @meals
    end
end
