module Fluent
  class NewrelicMetricsInput < Fluent::Input
    PREFIX = 'https://api.newrelic.com/v2'
    Plugin.register_input 'newrelic_metrics', self

    # Define `router` method of v0.12 to support v0.10 or earlier
    unless method_defined?(:router)
      define_method("router") { Fluent::Engine }
    end

    def initialize
      super
      require 'rest-client'
    end

    config_param :tag, :string
    config_param :api_key, :string
    config_param :metrics, :string
    config_param :alert_policy_id, :default => nil do |val|
      val.nil? ? nil : val.split(',').map{ |id| id.to_i }
    end

    config_param :interval, :time, default: '1m'

    def configure(conf)
      super
      @state = {}
    end

    def start
      @thread = Thread.new(&method(:run))
    end

    def shutdown
      Thread.kill(@thread)
    end

    def run
      loop do
        Thread.new(&method(:emit_newrelic_metrics))
        sleep @interval
      end
    end

    def emit_newrelic_metrics
      begin
        results = RestClient.get PREFIX + "/#{@metrics}.json", 'X-Api-Key' => @api_key
        records = JSON.parse(results)[@metrics]
        if @alert_policy_id
          records = records.select{ |record|
            @alert_policy_id.include?(record['links']['alert_policy'])
          }
        end
        records.each do |record|
          before_last_reported_at = @state["#{record['id']}"]
          last_reported_at = Time.parse(record['last_reported_at'])
          if before_last_reported_at.nil? || (before_last_reported_at < last_reported_at)
            router.emit @tag, last_reported_at.to_i, record
            @state["#{record['id']}"] = last_reported_at
          end
        end
      rescue => e
        log.error e
      end
    end
  end
end
