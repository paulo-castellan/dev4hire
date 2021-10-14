class HomeController < ApplicationController
  before_action :authenticate_person, only: [:search]

  def welcome
    if dev_signed_in?
      if current_dev.dev_profile.blank?
        redirect_to new_dev_profile_path
      end
    end
  end


  def search
    @projects = Project.where('title like ? OR detailed_description like ?', "%#{params[:q]}%", "%#{params[:q]}%")
  end
  private

  def authenticate_person
    return if dev_signed_in? or user_signed_in?

    flash.notice = 'Você deve estar logado para acessar essa página'
    redirect_to root_path
  end
end
