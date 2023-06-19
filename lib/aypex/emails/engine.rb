require "rails/engine"

module Aypex
  module Emails
    class Engine < Rails::Engine
      isolate_namespace Aypex
      engine_name "aypex_emails"

      def self.activate
        Dir.glob(File.join(File.dirname(__FILE__), "../../../app/**/*_decorator*.rb")).sort.each do |c|
          Rails.configuration.cache_classes ? require(c) : load(c)
        end
      end

      config.to_prepare(&method(:activate).to_proc)
    end
  end
end
