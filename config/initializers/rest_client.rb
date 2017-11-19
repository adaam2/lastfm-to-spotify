RestClient.log = 'stdout'

if ENV.fetch("SHOW_DETAILED_RESTCLIENT_LOGS", "0") == "1"
  module RestClientLogResponsePatch
    def process_result(res, &block)
      response = super
      log_response_with_body(response) unless res.is_a?(Net::HTTPRedirection)
      response
    rescue RestClient::Exception => exception
      log_response_with_body(exception.response)
      raise exception
    end

    private

    def log_response_with_body(response)
      return unless RestClient.log
      RestClient.log << "RestClient.#{method} #{response.code} #{url} => #{response.body.truncate(1024)}"
    end
  end

  RestClient::Request.prepend(RestClientLogResponsePatch)
end
