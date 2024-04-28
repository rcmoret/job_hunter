# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root "job_listings/index#call"

  namespace :job_listing, module: :job_listings, as: "" do
    get "/new", to: "new#call", as: :new_job_listing
    get "/:job_listing_id", to: "show#call", as: :job_listing_show
    post "/", to: "create#call", as: :post_job_listing
    delete "/:job_listing_id", to: "delete#call", as: :delete_job_listing
  end

  scope "job_listing/:job_listing_id", module: :job_listings do
    namespace :events, as: "" do
      get "/new", to: "new#call", as: :new_job_listing_event
      get "/:id/edit", to: "edit#call", as: :edit_job_listing_event
      put "/:id", to: "update#call", as: :update_job_listing_event
      post "/", to: "create#call", as: :job_listing_event
    end
  end

  # get "/job_listing/new", to: "job_listings/new#call", as: :new_job_listing
  # get "/job_listing/:id", to: "job_listings/show#call", as: :job_listing_show
  # post "/job_listing", to: "job_listings/create#call", as: :post_job_listing
end
