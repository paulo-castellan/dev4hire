class DevProfilesController < ApplicationController
  before_action :authenticate_dev!

  def new
    @dev_profile = DevProfile.new
    @expertise = Expertise.all
  end

  def create
    @dev_profile = DevProfile.new(dev_profile_params)
    @dev_profile.dev = current_dev
    
    if @dev_profile.save
      redirect_to @dev_profile, notice: 'Parabéns, seu perfil foi atualizado com sucesso'
    else
      render :new
    end
  end

  def edit
    @dev_profile = DevProfile.find(params[:id])
    @expertise = Expertise.all
  end


  def show
    @dev_profile = DevProfile.find(params[:id])
  end

  def update
    @dev_profile = DevProfile.find(params[:id])
    @dev_profile.update(dev_profile_params)
    redirect_to dev_profile_path

  end


  private

  def dev_profile_params
    params.require(:dev_profile).permit(:full_name, :social_name, :date_of_birth,
                                        :academic_education, :previous_experience,
                                        :description, :expertise_id, :dev_id)
  end
end
