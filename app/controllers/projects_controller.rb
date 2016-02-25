class ProjectsController < ApplicationController
  before_filter :require_login, except: [:index]
    def index
      @projects = Project.all
    end

    def new
      # if current_user.admin? || current_user.vetted?
      @project = Project.new
      # else
      # redirect_to root_path
      # end
    end

    def create
      @project = Project.new(project_params)

      if @project.save
        redirect_to projects_path, notice: "Project successfully created!"
      else
        render :new
      end
    end

    def show
      @project = Project.find(params[:id])
      # @rewards = @project.rewards
    end

    private
    def project_params
      params.require(:project)
            .permit(:title, :description, :goal, :end_date,
             rewards_attributes: [:title, :description, :amount, :_destroy])
    end

end
