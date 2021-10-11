class WorkTypesController < ApplicationController
  before_action :authenticate_user!

  def new
    @work_type = WorkType.new()
  end

  def create
    @work_type = WorkType.new(params.require(:work_type).permit(:description))
    
    if @work_type.save
      redirect_to projects_path
    else
      render :new
    end
  end
end
