class ProjectConfigurationsController < ApplicationController
  before_action :set_project_configuration, only: [:show, :edit, :update, :destroy]

  # GET /project_configurations
  # GET /project_configurations.json
  def index
    @configuration = ProjectConfiguration.first
  end

  # GET /project_configurations/new
  def new
    @project_configuration = ProjectConfiguration.new
  end

  # GET /project_configurations/1/edit
  def edit
  end

  # POST /project_configurations
  # POST /project_configurations.json
  def create
    @project_configuration = ProjectConfiguration.new(project_configuration_params)

    respond_to do |format|
      if @project_configuration.save
        format.html { redirect_to project_configurations_path, notice: 'Project configuration was successfully created.' }
        format.json { render action: 'show', status: :created, location: @project_configuration }
      else
        format.html { render action: 'new' }
        format.json { render json: @project_configuration.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /project_configurations/1
  # PATCH/PUT /project_configurations/1.json
  def update
    respond_to do |format|
      if @project_configuration.update(project_configuration_params)
        format.html { redirect_to project_configurations_path, notice: 'Project configuration was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @project_configuration.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /project_configurations/1
  # DELETE /project_configurations/1.json
  def destroy
    @project_configuration.destroy
    respond_to do |format|
      format.html { redirect_to project_configurations_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project_configuration
      @project_configuration = ProjectConfiguration.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_configuration_params
      params.require(:project_configuration).permit(:name, :source, :destination, :enabled)
    end
end
