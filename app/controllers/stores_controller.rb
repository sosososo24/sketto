class StoresController < ApplicationController

  
  def edit
  end

  def update
    if current_store.update(store_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def show
    @helplists = current_store.helplists.page(params[:page]).per(10).order("date DESC")
    @helplist = Helplist.new
  end

  private

  def store_params
    params.require(:store).permit(:name, :email)
  end

end
