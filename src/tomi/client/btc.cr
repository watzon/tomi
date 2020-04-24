module Tomi
  class Client
    class BTC < Client
      def blockchain_info
        rpc_request(JsonRpc::Response(JSON::Any), "getblockchaininfo")
      end

      def get_balance(address = nil)
        rpc_request(JsonRpc::Response(JSON::Any), "getbalance", address ? [address] : nil)
      end

      def get_account(address)
        rpc_request(JsonRpc::Response(JSON::Any), "getaccount", [address])
      end

      def import_private_key(key : String, label : String? = nil, rescan = true)
        rpc_request(JsonRpc::Response(JSON::Any), "importprivkey", [key, label, rescan])
      end
    end
  end
end
