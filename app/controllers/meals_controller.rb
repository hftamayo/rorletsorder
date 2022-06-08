class MealsController < ApplicationController
    #get /meals
    def index
        @meals = Meal.all

        respond_to do |format|
            format.html
            format.json {render json: @meals}
        end
        #render json: @meals
    end
end
