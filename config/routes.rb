Rails.application.routes.draw do
  get 'homepage/index' , to: 'homepage#index'
  post 'homepage/index' , to: 'homepage#index'

  get 'homepage/show/:id/:serie', to: 'homepage#show'
  post 'homepage/show/:id/:serie', to: 'homepage#show', as: 'episodios_bb'
  post 'homepage/show/:id/:serie', to: 'homepage#show', as: 'episodios_bcs'

  get 'homepage/:chapter/:season/:serie', to: 'homepage#new'
  post 'homepage/:chapter/:season/:serie', to: 'homepage#new', as: 'episodio_bb'
  post 'homepage/:chapter/:season/:serie', to: 'homepage#new', as: 'episodio_bcs'

  get 'homepage/:character', to: 'homepage#edit'
  post 'homepage/:character', to: 'homepage#edit', as: 'personaje'

  get 'search', to: 'homepage#update'
  post 'search', to: 'homepage#update'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
