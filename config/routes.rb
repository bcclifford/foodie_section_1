Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root :to => "dishes#index"
  # Routes for the Neighborhood resource:

  # CREATE
  get("/neighborhoods/new", { :controller => "neighborhoods", :action => "new_form" })
  post("/create_neighborhood", { :controller => "neighborhoods", :action => "create_row" })

  # READ
  get("/neighborhoods", { :controller => "neighborhoods", :action => "index" })
  get("/neighborhoods/:id_to_display", { :controller => "neighborhoods", :action => "show" })

  # UPDATE
  get("/neighborhoods/:prefill_with_id/edit", { :controller => "neighborhoods", :action => "edit_form" })
  post("/update_neighborhood/:id_to_modify", { :controller => "neighborhoods", :action => "update_row" })

  # DELETE
  get("/delete_neighborhood/:id_to_remove", { :controller => "neighborhoods", :action => "destroy_row" })

  #------------------------------

  devise_for :users
  # Routes for the User resource:

  # READ
  get("/users", { :controller => "users", :action => "index" })
  get("/users/:id_to_display", { :controller => "users", :action => "show" })

  #------------------------------

  # Routes for the Favorite resource:

  # CREATE
  get("/favorites/new", { :controller => "favorites", :action => "new_form" })
  post("/create_favorite", { :controller => "favorites", :action => "create_row" })
  post("/create_favorite_from_venue", { :controller => "favorites", :action => "create_row_from_venue" })
  post("/create_favorite_from_cuisine", { :controller => "favorites", :action => "create_row_from_cuisine" })
  post("/create_favorite_from_dish", { :controller => "favorites", :action => "create_row_from_dish" })

  # READ
  get("/favorites", { :controller => "favorites", :action => "index" })
  get("/favorites/:id_to_display", { :controller => "favorites", :action => "show" })

  # UPDATE
  get("/favorites/:prefill_with_id/edit", { :controller => "favorites", :action => "edit_form" })
  post("/update_favorite/:id_to_modify", { :controller => "favorites", :action => "update_row" })

  # DELETE
  get("/delete_favorite/:id_to_remove", { :controller => "favorites", :action => "destroy_row" })
  get("/delete_favorite_from_user/:id_to_remove", { :controller => "favorites", :action => "destroy_row_from_user" })
  get("/delete_favorite_from_venue/:id_to_remove", { :controller => "favorites", :action => "destroy_row_from_venue" })
  get("/delete_favorite_from_cuisine/:id_to_remove", { :controller => "favorites", :action => "destroy_row_from_cuisine" })
  get("/delete_favorite_from_dish/:id_to_remove", { :controller => "favorites", :action => "destroy_row_from_dish" })

  #------------------------------

  # Routes for the Venue resource:

  # CREATE
  get("/venues/new", { :controller => "venues", :action => "new_form" })
  post("/create_venue", { :controller => "venues", :action => "create_row" })
  post("/create_venue_from_neighborhood", { :controller => "venues", :action => "create_row_from_neighborhood" })

  # READ
  get("/venues", { :controller => "venues", :action => "index" })
  get("/venues/:id_to_display", { :controller => "venues", :action => "show" })

  # UPDATE
  get("/venues/:prefill_with_id/edit", { :controller => "venues", :action => "edit_form" })
  post("/update_venue/:id_to_modify", { :controller => "venues", :action => "update_row" })

  # DELETE
  get("/delete_venue/:id_to_remove", { :controller => "venues", :action => "destroy_row" })
  get("/delete_venue_from_neighborhood/:id_to_remove", { :controller => "venues", :action => "destroy_row_from_neighborhood" })

  #------------------------------

  # Routes for the Cuisine resource:

  # CREATE
  get("/cuisines/new", { :controller => "cuisines", :action => "new_form" })
  post("/create_cuisine", { :controller => "cuisines", :action => "create_row" })

  # READ
  get("/cuisines", { :controller => "cuisines", :action => "index" })
  get("/cuisines/:id_to_display", { :controller => "cuisines", :action => "show" })

  # UPDATE
  get("/cuisines/:prefill_with_id/edit", { :controller => "cuisines", :action => "edit_form" })
  post("/update_cuisine/:id_to_modify", { :controller => "cuisines", :action => "update_row" })

  # DELETE
  get("/delete_cuisine/:id_to_remove", { :controller => "cuisines", :action => "destroy_row" })

  #------------------------------

  # Routes for the Dish resource:

  # CREATE
  get("/dishes/new", { :controller => "dishes", :action => "new_form" })
  post("/create_dish", { :controller => "dishes", :action => "create_row" })
  post("/create_dish_from_cuisine", { :controller => "dishes", :action => "create_row_from_cuisine" })

  # READ
  get("/dishes", { :controller => "dishes", :action => "index" })
  get("/dishes/:id_to_display", { :controller => "dishes", :action => "show" })

  # UPDATE
  get("/dishes/:prefill_with_id/edit", { :controller => "dishes", :action => "edit_form" })
  post("/update_dish/:id_to_modify", { :controller => "dishes", :action => "update_row" })

  # DELETE
  get("/delete_dish/:id_to_remove", { :controller => "dishes", :action => "destroy_row" })
  get("/delete_dish_from_cuisine/:id_to_remove", { :controller => "dishes", :action => "destroy_row_from_cuisine" })

  #------------------------------

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
