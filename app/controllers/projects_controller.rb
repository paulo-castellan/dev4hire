class ProjectsController < ApplicationController
  before_action :authenticate_person, only: [:index, :show]
  before_action :authenticate_user!, only: [:new, :create, :my_projects]

  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
    @dev = current_dev
    @project_proposition = current_dev
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

  def my_projects
    @projects = current_user.projects
  end

  def end_project
    @project = Project.find(params[:id])
    @project.inactive!
    redirect_to my_projects_projects_path
  end
  
  def search
    @projects = Project.where("title LIKE ?", "%#{params[:q]}%")
  end

  private

  def project_params
    params.require(:project).permit(:title, :detailed_description, :skill_sets,
                                    :max_payment_per_hour, :hire_date_limit,
                                    :user_id, :work_type_id, :q)
  end

  def authenticate_person
    return if dev_signed_in? or user_signed_in?

    flash.notice = 'Você deve estar logado para acessar essa página'
    redirect_to root_path
  end

  
end