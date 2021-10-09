class DevProfilesController < ApplicationController
  def new
    @dev_profile = DevProfile.new
  end

  def show
    @dev_profile = DevProfile.find(params[:id])
  end

  def create
    @dev_profile = DevProfile.new(dev_profile_params)
    @dev_profile.dev = current_dev
    
    if @dev_profile.save
      redirect_to @dev_profile, notice: 'Parabéns, seu perfil foi completado com sucesso'
    else
      render :new
    end
  end

  private

  def dev_profile_params
    params.require(:dev_profile).permit(:full_name, :social_name, :date_of_birth,
                                        :academic_education, :previous_experience,
                                        :description, :dev_id)
  end
end
