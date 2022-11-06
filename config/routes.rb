Selfstarter::Application.routes.draw do
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    root :to => 'crowdfunding#index'
    match '/crowdfunding' => 'crowdfunding#index', :via => [:get,:post]
    get 'crowdfunding/checkout'
    match '/crowdfunding/checkout' => 'crowdfunding#checkout!', :via => :post
    match '/crowdfunding/share/:uuid' => 'crowdfunding#share', :via => :get
  end
end
