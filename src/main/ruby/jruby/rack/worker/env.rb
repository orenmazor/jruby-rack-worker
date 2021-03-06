module JRuby
  module Rack
    module Worker
      
      ENV = Hash.new do |hash, key|
        if hash.key? key = key.to_s
          hash[key]
        else
          manager = self.manager
          val = manager ? manager.getParameter(key) : nil
          val = ::ENV[key] if val.nil?
          hash[key] = val
        end
      end
      
      def self.manager; $worker_manager; end
      
    end
  end
end