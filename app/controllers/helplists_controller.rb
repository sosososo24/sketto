class HelplistsController < ApplicationController

  def index
    @helplists = Helplist.all
    @stores = Store.all
    @helplist = Helplist.new
  end

  def create
    @helplist = Helplist.new(helplist_params)
    if @helplist.save
      redirect_to helplists_path
    else
      render helplists_path
    end
  end

  def destroy
    @helplist = Helplist.find(params[:id])
    
    if @helplist.destroy
      redirect_to helplists_path
    else
      render helplists_path
    end
  end

  private
  def helplist_params
    params.require(:helplist).permit(:date, :starttime, :endtime).merge(store_id: current_store.id)
  end
  
end
