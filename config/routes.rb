Inx::Application.routes.draw do
  get "admin_admin_activations/index"
  get "admin_admin_activations/activate"
  get "admin_admin_activations/deactivate"
  devise_for :admins
  root to: "main#index"
end
