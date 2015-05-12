# highcharts-image-api

Rails API for generating highchart charts on the server side.  Useful for embedding highcharts into emails or anywhere else where
javascript is not an option. Leverages the highchart-convert.js script as outlined developed [here](http://www.highcharts.com/component/content/article/2-news/52-serverside-generated-charts).

Requires Ruby 2.2.0 and phantomjs.

## Getting Started Locally

Clone the project

```bash
git clone git://github.com/nicolaasnel/highchart-image-api.git
```

Install gems
```bash
cd highchart-image-api
gem install bundler
bundle
```

Install phantomjs
```bash
gem install brew
brew install phantomjs
```

Start up the server
```bash
rails server
```

Generate a chart using curl
```bash
HIGHCHART_OBJECT=`cat ./spec/fixtures/input.json`
curl -X POST -d "input=$HIGHCHART_OBJECT" http://localhost:3000/highchartsapi/chart_images -o ./chart.png
```

Or optionally with width:
```bash
curl -X POST -d "input=$HIGHCHART_OBJECT&width=900" http://localhost:3000/highchartsapi/chart_images -o ./chart.png
```

## Calling API from ruby

Using [httparty](https://github.com/jnunemaker/httparty):
```ruby
require 'httparty'

chart_object_js = File.read('spec/fixtures/input.json')
response = HTTParty.post('http://localhost:3000/highchartsapi/chart_images', body: {input: chart_object_js, width:550})
File.open('./chart.png', 'wb'){ |file| file << response.body }
```

Where chart_object_js is a [string value](spec/fixtures/input.json) that can be passed into the Highcharts.Chart constructor.




