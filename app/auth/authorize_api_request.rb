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

    
end