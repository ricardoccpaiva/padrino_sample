PadrinoSample::App.controllers :foo do
  get :index, :map => '/foo/bar' do
    'my custom response'.humanize
  end
end
