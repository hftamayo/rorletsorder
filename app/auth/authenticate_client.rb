class AuthenticateClient
    def initialize(email, password)
        @email = email
        @password = password
    end

    def call
        JsonWebToken.encode(client_id: client.id) if client
    end

    private

    sttr_reader :email, :password

    def client
        client = Client.find_by_email(email: email)
        return client if client && client.authenticate(password)

        raise(ExceptionHandler::AuthenticateError, Message.invalid_credentials)
    end
end