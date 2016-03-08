class HomeController < ApplicationController
  def main
    redirect_to new_user_registration_path
  end
end
