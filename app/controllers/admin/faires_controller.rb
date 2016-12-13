class Admin::FairesController < Admin::BaseController
  def index
  end

  def show
    @faire = Faire.find(params[:id])
  end

  def new
    @faire = Faire.new
  end

  def create
    @faire = current_user.faires.new(faire_params)
    if @faire.save
      redirect_to admin_path
    else
      flash[:notice] = @faire.errors.full_messages.join(", ")
      render :new
    end
  end

  def edit
    @faire = Faire.find(params[:id])
  end

  def update
    @faire = Faire.find(params[:id])
    @faire.update(faire_params)
    redirect_to admin_path
  end

  private

  def faire_params
    params.require(:faire).permit(:title, :description, :city_id)
  end
end
