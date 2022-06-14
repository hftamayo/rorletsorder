class AuthenticationController < ApplicationController
    before_action :authorize_request, except: :login

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
    params.permit(:email, :password_digest)
  end
end
