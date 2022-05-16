Rails.application.routes.draw do

  # 顧客用
  # URL /customers/sign_in ...
  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  scope module: :public do
    post 'orders/confirm' => 'orders#confirm'
    get 'orders/finish' => 'orders#finish'
    resources :orders, only: [:index, :show, :new, :create] 
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
