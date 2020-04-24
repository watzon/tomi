require "json_rpc"

module Tomi
  abstract class Client
    getter rpc_client : JsonRpc::HttpClient

    def initialize(host, port, user = nil, password = nil)
      http_client = HTTP::Client.new(host, port)
      http_client.basic_auth(username, password) if username && password
      @rpc_client = JsonRpc::HttpClient.new(http_client)
    end

    def rpc_request(response_type, method, arguments = nil)
      if arguments
        rpc_client.call(response_type, method, arguments)
      else
        rpc_client.call(response_type, method)
      end
    end
  end
end
