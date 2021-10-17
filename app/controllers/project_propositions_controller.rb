class ProjectPropositionsController < ApplicationController
  before_action :authenticate_dev!, only: [:new, :create]
  before_action :authenticate_user!, only: [:accept, :deny]

  def index
    @project_proposition = ProjectProposition.all
    @dev = current_dev
  end

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

  def accept
    @project_proposition = ProjectProposition.find(params[:id])
    @project_proposition.accepted!
    @project_proposition.accepted_time = Time.now
    redirect_to @project_proposition.project
  end

  def deny
    @project_proposition = ProjectProposition.find(params[:id])
    @project_proposition.update(params.require(:project_proposition).permit(:rejection_motive))
    if @project_proposition.rejection_motive.blank?
      flash.notice = 'Motivo da rejeição deve ser fornecido'
    else
      @project_proposition.rejected!
      flash.notice = 'Você rejeitou a proposta'
    end
    redirect_to @project_proposition.project
  end

  def cancel
    @project_proposition = ProjectProposition.find(params[:id])
    if @project_proposition.update(params.require(:project_proposition).permit(:cancel_motive))
      redirect_to project_project_propositions_path(@project_proposition.project.id)
      flash.notice = 'Você cancelou a proposta'
    else
      redirect_to project_project_propositions_path(@project_proposition.project.id)
      flash.notice = 'Você não pode cancelar o projeto depois de 3 dias após o aceite'
    end
  end

  private

  def project_proposition_params
    params.require(:project_proposition).permit(:motivation, :expected_payment,
                                                :available_hours_per_week, :expectations,
                                                :dev_id, :project_id)
  end
end
