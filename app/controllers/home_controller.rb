class HomeController < ApplicationController
  def welcome
    if dev_signed_in?
      if current_dev.dev_profile.blank?
        redirect_to new_dev_profile_path
      end
    end
  end
end
