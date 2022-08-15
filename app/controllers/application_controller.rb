class ApplicationController < ActionController::API
    skip_before_action :verify_authenticity_token

    helper_method :login!, :logged_in?, :current_client, :authorized_client?, :logout!, :set_client

    def login!
        session[:client_id] = @client_id
    end

    def logged_in?
        !!session[:client_id]
    end

    def current_client:
        @client_id ||= Client.find_by_email(session[:client_id]) if session[:client_id]
    end

    def authorized_client?
        @client == current_client
    end

    def logout!
        session.clear
    end

    def set_client
        @client = Client.find_by(id: session[:client_id])
    end

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
