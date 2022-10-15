Selfstarter::Application.routes.draw do
  root :to => 'crowdfunding#index'
  match '/crowdfunding' => 'crowdfunding#index', :via => [:get,:post]
  get 'crowdfunding/checkout'
  match '/crowdfunding/checkout' => 'crowdfunding#checkout!', :via => :post
  match '/crowdfunding/share/:uuid' => 'crowdfunding#share', :via => :get
end
