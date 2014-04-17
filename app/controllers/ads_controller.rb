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
    redirect_to "/ads/#{@ad.id}"
  end

  def edit
    @ad = Ad.find(params[:id])
  end

  def update
    @ad = Ad.find(params[:id])
    @ad.update(params_ad)
    redirect_to "/ads/#{@ad.id}"
  end


  private
    def params_ad
      params.require(:ad).permit(:name, :description, :price, :seller_id, :email, :img_url)
    end
end
