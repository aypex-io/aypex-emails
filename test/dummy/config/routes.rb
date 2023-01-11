Rails.application.routes.draw do
  mount Aypex::Emails::Engine => "/aypex-emails"
end
