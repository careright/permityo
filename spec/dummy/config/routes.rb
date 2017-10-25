Dummy::Application.routes.draw do
  get '/dummy/do_good' => 'dummy#do_good'
  get '/dummy/do_evil' => 'dummy#do_evil'
  get '/dummy/have_instance_variables' => 'dummy#have_instance_variables'

  get '/dummy_beta' => 'dummy_beta#index'
  get '/dummy_gamma' => 'dummy_gamma#index'

end
