class ProjectPropositionsController < ApplicationController
  before_action :authenticate_dev!

  def new
    @project_proposition = ProjectProposition.new
    @dev = current_dev
  end

  def create
    @project_proposition = ProjectProposition.new(project_proposition_params)
    @project_proposition.dev = current_dev
    
    if @project_proposition.save
      redirect_to projects_path
      flash.notice = "Parabéns, você declarou interesse para o projeto #{@project_proposition.project.title}"
    else
      render :new
    end
  end

  private

  def project_proposition_params
    params.require(:project_proposition).permit(:motivation, :expected_payment,
                                                :available_hours_per_week, :expectations,
                                                :dev_id)
  end
end
