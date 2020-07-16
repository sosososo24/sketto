class HelplistsController < ApplicationController

  def index
    @helplists = Helplist.all.order(date: "DESC")
    @helplist = Helplist.new
  end

  def create
    @helplist = Helplist.new(helplist_params)
    if @helplist.save
      redirect_to "/stores/#{current_store.id}"
    else
      render "/stores/#{current_store.id}"
    end
  end

  def destroy
    @helplist = Helplist.find(params[:id])
    
    if @helplist.destroy
      redirect_to "/stores/#{current_store.id}"
    else
      render "/stores/#{current_store.id}"
    end
  end

  def search
    @helplists = Helplist.search(params[:search])
  end

  private
  def helplist_params
    params.require(:helplist).permit(:date, :starttime, :endtime).merge(store_id: current_store.id)
  end
  
end
