class BusinessesController < ApplicationController
  before_action :require_login

  def index
  end

  def show
    @business = Business.find(params[:id])
  end

  def new
    @business = Business.new
  end

  def create
    @business = current_user.businesses.new(business_params)
    if @business.save
      redirect_to vendor_home(current_user)
    else
      flash[:notice] = @business.errors.full_messages.join(", ")
      render :new
    end
  end

  def edit
    @business = Business.find(params[:id])
  end

  def update
    @business = Business.find(params[:id])
    @business.update(business_params)
    redirect_to business_path(@business)
  end

  private

  def business_params
    params.require(:business).permit(
    :business_name,
    :product_description,
    :street_address,
    :city,
    :state,
    :zip)
  end
end
