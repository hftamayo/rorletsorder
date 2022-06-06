class ClientsController < ApplicationController
        #GET /clients
        def index
            @clients = Client.all
            render json: @clients
        end
    
        #GET /client/:id
        def show
            @client = Client.find(params[:id])
            render json: @client
        end
    
        #POST /clients
        def create
            @client = Client.new(client_params)
            if @client.save
                render json: @client
            else
                render error: { error: 'Unable to signup the client'}, status: 400
            end
        end
    
        #PUT /clients/:id
        def update
            @client = Client.find(params[:id])
            if @client
                @client.update(client_params)
                render json: { message: 'Client successfully updated.'}, status: 200
            else
                render json: { error: 'Unable to update client data.', status: 400}
            end
        end
    
    
        #DELETE /clients/:id
        def destroy
            @client = Client.find(params[:id])
            if @client
                @client.destroy
                render json: { message: 'Client successfully deleted.'}, status: 200
            else
                render json: { error: 'Unable to delete Client.'}, status: 400
            end
        end
    
        private
    
        def client_params
            params.require(:client).permit(:firstname, :lastname, :email, :password_digest)
        end
end
