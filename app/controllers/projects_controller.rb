class ProjectsController < ApplicationController
  before_action :authenticate_user!

  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
  end

  def new
    @project = Project.new
    @work_type = WorkType.all
  end

  def create
    @project = Project.new(project_params)
    @project.user = current_user

    if @project.save
      redirect_to projects_path
      flash.notice = 'Projeto criado com sucesso'
    else
      render :new
    end
  end

  private

  def project_params
    params.require(:project).permit(:title, :detailed_description, :skill_sets,
                                    :max_payment_per_hour, :hire_date_limit,
                                    :user_id, :work_type_id)
  end
end