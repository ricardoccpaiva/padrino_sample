PadrinoSample::App.controllers :foo do
  get :index, :map => '/foo/bar' do
    require 'pry'
    binding.pry
    'my custom response'.humanize
  end
end
