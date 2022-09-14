Selfstarter::Application.routes.draw do
  root :to => 'preorder#index'
  match '/preorder'               => 'preorder#index', :via => [:get,:post]
  get 'preorder/checkout'
  match '/preorder/checkout' => 'preorder#checkout!', :via => :post
  match '/preorder/share/:uuid' => 'preorder#share', :via => :get
end
