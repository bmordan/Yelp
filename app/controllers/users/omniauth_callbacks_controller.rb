class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    redirect_to restaurants_path
  end
end