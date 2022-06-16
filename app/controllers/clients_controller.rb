class ClientsController < ApplicationController
    skip_before_action :authorize_request, only: :create
    #skip_before_action :find_client, except: %i[create index]
    skip_before_action :verify_authenticity_token, :only => :create

        #GET /clients
        def index
            @clients = Client.all
            render json: @clients, status: :ok
        end
    
        #GET /client/:id
        def show
            @client = Client.find(params[:id])
            render json: @client, status: :ok
        end
    
        #POST /clients
        def create
            @client = Client.new(client_params)
            auth_token = AuthenticateClient.new(client.email, client.password).call
            if @client.save
                response = { json: @client, message: Message.account_created, auth_token: auth_token }
            else
                response = { errors: @client.errors.full_messages , status: 400 }
            end
        end
    
        #PUT /clients/:id
        def update
            @client = Client.find(params[:id])
            if @client
                @client.update(client_params)
                render json: { message: 'Client successfully updated.'}, status: 200
            else
                render json: { errors: @client.errors.full_messages }, status: :unprocessable_entity
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

        def find_client
            @client = Client.find_by_email!(params[:_email])
            rescue ActiveRecord::RecordNotFound
              render json: { errors: 'User not found' }, status: :not_found
          end        
    
        private
    
        def client_params
            params.permit(:firstname, :lastname, :email, :password)
        end
end
