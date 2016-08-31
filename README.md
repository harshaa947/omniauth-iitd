**IMPORTANT: If you're running < 1.5.1, please upgrade to the latest version to address 3 security vulnerabilities.


---
**These notes are based on master, please see tags for README pertaining to specific releases.**

IITD OAuth2 Strategy for OmniAuth.

Supports the OAuth 2.0 server-side and client-side flows. 

## Installing

Add to your `Gemfile`:

```ruby
gem 'omniauth-iitd'
```

Then `bundle install`.

## Usage

`OmniAuth::Strategies::Iitd` is simply a Rack middleware. Read the OmniAuth docs for detailed instructions: https://github.com/intridea/omniauth.

Here's a quick example, adding the middleware to a Rails app in `config/initializers/omniauth.rb`:

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :iitd, ENV['iitd_client_KEY'], ENV['iitd_client_secret']
end
```



## Configuring

You can configure several options, which you pass in to the `provider` method via a `Hash`:





### API Version

OmniAuth Iitd uses unversioned API endpoints by default. You can configure custom endpoints via `client_options` hash passed to `provider`.

```ruby
use OmniAuth::Builder do
  provider :iitd, ENV['APP_ID'], ENV['APP_SECRET'],
    :client_options => {
      :site => 'https://oauth.iitd.ac.in',
      :authorize_url => "https://oauth.iitd.ac.in/authorize.php"
	  :token_url => "https://oauth.iitd.ac.in/token.php"
    }
end
```
## Manually adding to the application 

Run following commands -  
git clone https://github.com/harshaa947/omniauth-iitd.git  
cd omniauth-iitd  
gem build omniauth-iitd.gemspec

Add a line to your Gemfile  
gem 'omniauth-iitd' , path => 'your path'

bundle install.

## License

Copyright (c) 2016 by Harsh Arya

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

