Rails.application.routes.draw do
  resources :checkins
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

	resources :players do
		resources :questions do
			resources :answers, :notifications
		end
	end 

	resources :coaches do
		resources :questions, :players
	end
  
  resources :questions do 
  	resources :notifications
  end

  resources :notifications
end
