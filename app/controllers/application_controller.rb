class ApplicationController < ActionController::API
    #include ActionController::MimeResponds
    skip_before_action :authorize_request, only: :authenticate, raise: false

    include Response
    include ExceptionHandler

    #called before every action on controller
    before_action :authorize_request
    attr_reader :current_client

    def not_found
        render json: { error: 'not_found' }
    end

    def authorize_request
        header = request.headers['Authorization']
        header = header.split(' ').last if header
        begin
        @decoded = JsonWebToken.decode(header)
        @current_user = User.find(@decoded[:user_id])
        rescue ActiveRecord::RecordNotFound => e
        render json: { errors: e.message }, status: :unauthorized
        rescue JWT::DecodeError => e
        render json: { errors: e.message }, status: :unauthorized
        end
    end

    private

    #check for valid request token and return client
    def authorize_request
        @current_client = (AuthorizeApiRequest.new(request.headers).call)[:client]
    end
    
end
