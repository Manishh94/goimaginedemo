Rails.application.routes.draw do
  root 'products#index'

  get 'carts/:id' => "carts#show", as: "cart"
  delete 'carts/:id' => "carts#destroy"

  get 'line_items/:id/add' => "line_items#add_quantity", as: "line_item_add"
  get 'line_items/:id/reduce' => "line_items#reduce_quantity", as: "line_item_reduce"
  post 'line_items' => "line_items#create"
  get 'line_items/:id' => "line_items#show", as: "line_item"
  delete 'line_items/:id' => "line_items#destroy"

  resources :products
  resources :orders

  post 'checkout/create' => 'checkout#create', as: "checkout_create"
end
