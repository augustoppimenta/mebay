class AdsController < ApplicationController

  def index
    @ads = Ad.find(:all)
  end

  def show
    @ad = Ad.find(params[:id])
  end

  def new
    @ad = Ad.new
  end

  def create
    @ad = Ad.new(params_ad)
    @ad.save
  end


  private
    def params_ad
      params.require(:ad).permit(:name, :description, :price, :seller_id, :email, :img_url)
    end
end
