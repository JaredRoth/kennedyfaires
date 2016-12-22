class BusinessesController < ApplicationController
  before_action :require_login

  def index
  end

  def show
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
