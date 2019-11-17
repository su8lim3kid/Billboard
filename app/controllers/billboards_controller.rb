class BillboardsController < ApplicationController
  def index
    @billboards = Billboard.all
  end

  def show
  end

  def new
    @billboard = Billboard.new
    render partial: "form"
  end

  def edit
    render partial: "form"
  end 
  
  def create
    @billboard = Billboard.new(billboard_params)
    if @billboard.save
      redirect_to billboards_path
  end

  def update
    if @billboard.update(billboard_params)
      redirect_to billboards_path
    else 
      render :edit
    end
  end

  def destroy
    @billboard.destroy
    redirect_to billboards_path
  end




  private
    def set_billboard
      @billboard = Billboard.find(params[:id])
    end

    def billboard_params
      params.require(:billboard).permit(:first_name, :last_name,)
    end
 
end


