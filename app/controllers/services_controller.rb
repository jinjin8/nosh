class ServicesController < ApplicationController
  before_action :admin, only: [:new, :create, :edit, :destroy]

  def index
    @services = Service.all.order(:name)
  end

  def show
    @service = Service.find(params[:id])
  end

  def new
    @service = Service.new
  end

  def create
    @service = Service.new(service_params)
    if @service.save
      flash[:notice] = "Service successfully added!"
      redirect_to services_path
    else
      render :new
    end
  end

  def edit
    @service = Service.find(params[:id])
  end

  def update
    @service = Service.find(params[:id])
    if @service.update(service_params)
      flash[:notice] = "Service successfully updated!"
      redirect_to service_path
    else
      render :edit
    end
  end

  def destroy
    @service = Service.find(params[:id])
    @service.destroy
    redirect_to services_path
  end

  private
  def service_params
    params.require(:service).permit(:name, :description, :price)
  end
end
