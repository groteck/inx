Inx::Application.routes.draw do
  devise_for :admins
  root to: "main#index"
end
