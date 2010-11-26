Wrestling::Application.routes.draw do

  resources :bouts
  resources :wrestlers
  resources :teams
  resources :bouts do
    #match "match_setup", :on => :member
  end
  resources :events
  resources :scores
  resources :wrestlers
  
  # eh?
  resources :reports
  match "bouts/new/:id" , :controller => "bouts", :action => "new", :as => "quick_bout"
  match "bouts/match_setup/:id" , :controller => "bouts", :action => "match_setup", :as => "match_setup"
  
  #map.quick_bout 'bouts/new/:id', :controller => 'bouts', :action => 'new'
  #map.match_setup 'bouts/match_setup/:id', :controller => 'bouts', :action => 'match_setup'
  #map.reports 'reports/:team/:id', :controller => 'reports', :action => 'index'

end
