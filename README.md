# fluent-plugin-newrelic_metrics [![Build Status](https://secure.travis-ci.org/toyama0919/fluent-plugin-newrelic_metrics.png?branch=master)](http://travis-ci.org/toyama0919/fluent-plugin-newrelic_metrics)

NewrelicMetrics plugin for fluentd

## Examples
```
<source>
  type newrelic_metrics
  tag newrelic_applications.exsample
  interval 1m
  metrics applications # applications or servers
  api_key "#{ENV['NEWRELIC_API_KEY']}"
  alert_policy_id XXXXXX,YYYYYY # optional. comma separated values. default is all info.
</source>

<match newrelic_applications.exsample>
  type stdout
</match>

<source>
  type newrelic_metrics
  tag newrelic_servers.exsample
  interval 1m
  metrics servers # applications or servers
  api_key "#{ENV['NEWRELIC_API_KEY']}"
  alert_policy_id XXXXXX,YYYYYY # optional. comma separated values. default is all info.
</source>

<match newrelic_servers.exsample>
  type stdout
</match>
```

#### output
```
2015-10-16 10:00:01 +0900 infra.nerelic_servers: {"id":YYYYYY,"account_id":XXXXXX,"name":"web01","host":"web01","health_status":"green","reporting":true,"last_reported_at":"2015-10-16T01:00:01+00:00","summary":{"cpu":2.2,"cpu_stolen":0.77,"disk_io":0.29,"memory":51.1,"memory_used":1944059904,"memory_total":3806330880,"fullest_disk":39.3,"fullest_disk_free":18792000000},"links":{"alert_policy":123456}}
2015-10-16 10:00:01 +0900 infra.nerelic_servers: {"id":YYYYYY,"account_id":XXXXXX,"name":"web02","host":"web02","health_status":"green","reporting":true,"last_reported_at":"2015-10-16T01:00:01+00:00","summary":{"cpu":1.38,"cpu_stolen":0.37,"disk_io":0.13,"memory":25.2,"memory_used":960495616,"memory_total":3806330880,"fullest_disk":38.3,"fullest_disk_free":19102000000},"links":{"alert_policy":123456}}
```

## Installation
```
fluent-gem install fluent-plugin-newrelic_metrics
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new [Pull Request](../../pull/new/master)

## Information

* [Homepage](https://github.com/toyama0919/fluent-plugin-newrelic_metrics)
* [Issues](https://github.com/toyama0919/fluent-plugin-newrelic_metrics/issues)
* [Documentation](http://rubydoc.info/gems/fluent-plugin-newrelic_metrics/frames)
* [Email](mailto:toyama0919@gmail.com)

## Copyright

Copyright (c) 2015 Hiroshi Toyama

