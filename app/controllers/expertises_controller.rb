class ExpertisesController < ApplicationController
  def new
    @expertise = Expertise.new
  end

  def create
    @expertise = Expertise.new(params.require(:expertise).permit(:field_of_expertise))
    
    if @expertise.save
      redirect_to new_dev_profile_path, notice: 'Agora complete seu perfil'
    else
      render :new
    end
  end
end
