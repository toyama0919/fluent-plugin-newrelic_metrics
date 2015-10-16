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
#TODO
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

