class ProjectPropositionsController < ApplicationController
  before_action :authenticate_dev!

  def new
    @project_proposition = ProjectProposition.new
    @project_proposition.dev = current_dev
  end

  def create
    @project_proposition = ProjectProposition.new(project_proposition_params)
    @project_proposition.dev = current_dev
    @project_proposition.project = Project.find(params[:project_id])
    @project = @project_proposition.project

    if @project_proposition.save
      redirect_to project_path(@project)
      flash.notice = "Parabéns, você declarou interesse no projeto #{@project_proposition.project.title}" 
    else
      render :new
    end
  end

  private

  def project_proposition_params
    params.require(:project_proposition).permit(:motivation, :expected_payment,
                                                :available_hours_per_week, :expectations,
                                                :dev_id, :project_id)
  end
end
