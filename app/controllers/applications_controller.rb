class ApplicationsController < ApplicationController
  def index
    @applications = Application.all
  end

  def show
    @application = Application.find(params[:id])
    @events = @application.events.group_by(&:name)
  end

  def new
    @application = Application.new
  end

  def create
    @application = Application.new
    @application.name = params[:application][:name]
    @application.url = params[:application][:url]
    @application.user = current_user

    if @application.save
      flash[:notice] = "Application was saved."
      redirect_to @application
    else
      flash.now[:alert] = "There was an error saving the application. Please try again."
      render :new
    end
  end

  def edit
    @application = Application.find(params[:id])
  end

  def update
    @application = Application.find(params[:id])
    @application.name = params[:application][:name]
    @application.url = params[:application][:url]

    if @application.save
      flash[:notice] = "Application was updated."
      redirect_to @application
    else
      flash.now[:alert] = "There was an error saving the application. Please try again."
      render :edit
    end
  end

  def destroy
    @application = Application.find(params[:id])

    if @application.destroy
      flash[:notice] = "\"#{@application.name}\" was deleted successfully."
      redirect_to applications_path
    else
      flash.now[:alert] = "There was an error deleting the application."
      render :show
    end
  end

end
