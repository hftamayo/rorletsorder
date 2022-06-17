class AuthenticationController < ApplicationController
    #before_action :authorize_request, except: :login
    skip_before_action :verify_authenticity_token, :only => :authenticate
    skip_before_action :authorize_request, only: :authenticate, raise: false

    #/signup
    def authenticate
      auth_token = AuthenticateClient.new(auth_params[:email], auth_params[:password]).call
      json_response(auth_token: auth_token)
    end

    # POST /auth/login
    def login
      @client = Client.find_by_email(params[:email])
      if @client&.authenticate(params[:password_digest])
        token = JsonWebToken.encode(client_id: @client.id)
        time = Time.now + 24.hours.to_i
        render json: { token: token, exp: time.strftime("%m-%d-%Y %H:%M"),
                      email: @client.email }, status: :ok
      else
        render json: { error: 'unauthorized' }, status: :unauthorized
      end
    end

  private

  def login_params
    params.permit(:email, :password)
  end
end
