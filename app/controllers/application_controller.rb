class ApplicationController < ActionController::API

    def not_found
        render json: { error: 'not_found' }
    end

    def authorize_request
        header = request.headers['Authorization']
        header = header.split(' ').last if header
        begin
            @decoded = JsonWebToken.decode(header)
            @current_client = Client.find(@decoded[:client_id])
        rescue ActiveRecord::RecordNotFound => e
            render json: { errors: e.message }, status: :unauthorized
        rescue JWT::DecodeError => e
            render json: { errors: e.message }, status: :unauthorized
        end
    end

    #private

    #check for valid request token and return client
    #def authorize_request
        #@current_client = (AuthorizeApiRequest.new(request.headers).call)[:client]
    #end
    
end
