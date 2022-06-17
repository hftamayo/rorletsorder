class AuthorizeApiRequest
    def initialize(headers = {})
        @headers = headers
    end

    #return valid user client
    def call
        {
            client: client
        }
    end

    private

    attr_reader :headers

    def user
        #verify if the client is in the database
        #load object in memory
        @client ||= Client.find(decoded_auth_token[:client_id]) if decoded_auth_token
        #handler for client not found
    rescue ActiveRecord::RecordNotFound => e
        raise(
            ExceptionHandler::InvalidToken,
            ("#{Message.invalid_token} #{e.message}")
        )
    end

    #decoding auth token
    def decoded_auth_token
        @decoded_auth_token ||= JsonWebToken.decode(http_auth_header)
    end

    #checking for token in authorization header
    def http_auth_header
        if headers['Authorization'].present?
            return headers['Authorization'].split(' ').last
        end
        raise(ExceptionHandler::MissingToken.Message.missing_token)
    end


end