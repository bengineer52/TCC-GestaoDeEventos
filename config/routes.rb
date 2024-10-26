Rails.application.routes.draw do
  # Define a página inial da aplicação:
  root "events#index"

  # Define rotas para inscrições, apenas para criar e deletar:
  resources :subscriptions, only: %i[create destroy]
  # Define rotas para eventos - CRUD completo:
  resources :events

  # Define as rotas de login e registro de usuário:
  devise_for :users

  # Revela o status de saúde em /up que retorna 200 se o aplicativo inicializar sem exceções, caso contrário, retorna 500.
  # Pode ser usado por balanceadores de carga e monitores de disponibilidade para verificar se o aplicativo está ativo.
  get "up" => "rails/health#show", as: :rails_health_check
end
