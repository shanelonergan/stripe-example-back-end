Rails.application.routes.draw do
  post '/charges', to: 'charges#create'
end
