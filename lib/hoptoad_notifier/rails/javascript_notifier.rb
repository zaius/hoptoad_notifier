module HoptoadNotifier
  module Rails
    module JavascriptNotifier
      def self.included(base) #:nodoc:
        base.send(:after_filter, :insert_javascript_notifier)
      end

      private

      def insert_javascript_notifier
        return unless HoptoadNotifier.configuration.js_notifier

        path = File.join(File.dirname(__FILE__), '..', '..', 'templates', 'javascript_notifier.erb')
        host = HoptoadNotifier.configuration.host.dup
        port = HoptoadNotifier.configuration.port
        host << ":#{port}" unless port == 80

        javascript = @template.render(
          :file          => path,
          :use_full_path => false,
          :locals        => {
            :host        => host,
            :api_key     => HoptoadNotifier.configuration.api_key,
            :environment => HoptoadNotifier.configuration.environment_name
        })

        if response.body.respond_to?(:gsub!)
          response.body.gsub! /<(head)>/i, "<\\1>\n" + javascript
        end
      end
    end
  end
end
