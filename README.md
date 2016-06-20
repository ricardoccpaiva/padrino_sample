# Padrino sample API
The goal of this sample project is to demonstrate a error that occurs with a specific combination of padrino / activesupport gem versions.

Considering the following gem versions 
`````
gem 'padrino', '0.13.2'
gem 'activesupport', '= 3.2.22'
``````

and given that `padrino 0.13.2` requires `activesupport >= 3.1`

when invoking `'my custom response'.humanize` from the padrino controller, it fails as described below.


``````bash
# ricardo.paiva at ricardo.paiva-macbook in ~/Projects/ricardoccpaiva/padrino_sample on git:master ● [15:23:45]
→ padrino s
=> Padrino/0.13.2 has taken the stage development at http://127.0.0.1:3000
[2016-06-20 15:23:55] INFO  WEBrick 1.3.1
[2016-06-20 15:23:55] INFO  ruby 2.3.0 (2015-12-25) [x86_64-darwin15]
[2016-06-20 15:23:55] INFO  WEBrick::HTTPServer#start: pid=71839 port=3000

From: /Users/ricardo.paiva/Projects/ricardoccpaiva/padrino_sample/app/controllers/foo_controller.rb @ line 5 self.GET /foo/bar:

    1: PadrinoSample::App.controllers :foo do
    2:   get :index, :map => '/foo/bar' do
    3:     require 'pry'
    4:     binding.pry
 => 5:     'my custom response'.humanize
    6:   end
    7: end

[1] pry(#<PadrinoSample::App>)> s

From: /Users/ricardo.paiva/.rvm/gems/ruby-2.3.0/gems/padrino-support-0.13.2/lib/padrino-support/core_ext/string/inflections.rb @ line 103 String#humanize:

    102: def humanize(options = {})
 => 103:   ActiveSupport::Inflector.humanize(self, options)
    104: end

[1] pry("my custom response")> ActiveSupport::Inflector.humanize(self, options)
ArgumentError: wrong number of arguments (given 2, expected 1)
from /Users/ricardo.paiva/.rvm/gems/ruby-2.3.0/gems/activesupport-3.2.22/lib/active_support/inflector/methods.rb:94:in `humanize'
[2] pry("my custom response")>
``````
