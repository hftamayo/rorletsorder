class OrdertempsController < ApplicationController
    #GET /ordertemps
    def index
        @ordertemps = Ordertemp.all
        render json: @ordertemps
    end

    #GET /ordertemp/:id
    def show
        @ordertemp = Ordertemp.find(params[:id])
        render json: @ordertemp
    end

    #POST /ordertemps
    def create
        begin
            Ordertemp.transaction do
                @ordertemp = Ordertemp.create!(ordertemp_params)
            end

        rescue ActiveRecord::RecordInvalid => exception
            @ordertemp = {
                error: {
                    status: 422,
                    message: exception
                }
            }
        end
        render json: @ordertemp
    end

    #PUT /ordertemps/:id
    def update
        @ordertemp = Ordertemp.find(params[:id])
        if @ordertemp
            @ordertemp.update(ordertemp_params)
            render json: { message: 'Order successfully updated.'}, status: 200
        else
            render json: { error: 'Unable to update the order.', status: 400}
        end
    end


    #DELETE /ordertemps/:id
    def destroy
        @ordertemp = Ordertemp.find(params[:id])
        if @ordertemp
            @ordertemp.destroy
            render json: { message: 'Order successfully deleted.'}, status: 200
        else
            render json: { error: 'Unable to delete Order.'}, status: 400
        end
    end

    private

    def ordertemp_params
        #params.require(:ordertemp).permit( :clientName, :clientId, :amount, :mealid, :name, :price)
        params.permit(ordertemp: [:name, :amount, :price]).require(:ordertemp)
    end

end
