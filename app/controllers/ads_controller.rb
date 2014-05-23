class AdsController < ApplicationController

  before_filter :authenticate, only: [:edit, :update, :destroy]

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
    redirect_to ads_url
  end

  def destroy
    @ad = Ad.find(params[:id])
    @ad.destroy
    redirect_to "/ads"
  end


  private
    def params_ad
      params.require(:ad).permit(:name, :description, :price, :seller_id, :email, :img_url)
    end

    def authenticate
        authenticate_or_request_with_http_basic('Ads') do |username, password|
          username == 'admin' && password == 'password'
        end
    end
end
