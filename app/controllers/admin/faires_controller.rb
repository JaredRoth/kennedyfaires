class Admin::FairesController < Admin::BaseController
  def index
  end

  def new
    @faire = Faire.new
  end
end
