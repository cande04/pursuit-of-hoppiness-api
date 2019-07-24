# frozen_string_literal: true

Rails.application.routes.draw do
  resources :breweries, except: %i[new edit]
  resources :beers, except: %i[new edit]
  # RESTful routes
  resources :examples, except: %i[new edit]

  # Custom routes
  post '/sign-up' => 'users#signup'
  post '/sign-in' => 'users#signin'
  delete '/sign-out' => 'users#signout'
  patch '/change-password' => 'users#changepw'

  post '/search-beer' => 'beers#search_beer'
  post '/get-beer' => 'beers#fetch_beer'

  post '/search-breweries' => 'breweries#search_breweries'
  post '/get-brewery' => 'breweries#fetch_brewery'
end
