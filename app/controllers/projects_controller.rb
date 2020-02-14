class ProjectsController < ApplicationController
  def index
    @projects = Project.where.not(user_id: current_user.id).order("created_at DESC")
    @list = [["carpenter", "carpenter"],["hornamenter", "hornamenter"],["gardener","gardener"],["handyman","handyman"],["plomber","plomber"],["electricist","electricist"],["locksmith","locksmith"]]
  end

  def my_projects
    @projects = Project.where(user_id: current_user.id).order("created_at DESC")
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    @project.user_id =  current_user.id
    @project.save
      redirect_to @project
  end

  def show
    @project = Project.find(params[:id])
  end

  def destroy
      project = Project.find(params[:id])
      if current_user == project.user
        project.destroy
        redirect_to "/projects/"
        flash[:notice] = "project deleted"
      else
        redirect_back(fallback_location: "/")
        root_path
        flash[:alert] = "Not authorized to delete this post"
      end
    end

  private
    def project_params
        params.require(:project).permit(:description, :category, :image)
    end
end
