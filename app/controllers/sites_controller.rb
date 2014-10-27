class SitesController < ApplicationController
  before_action :set_site, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :correct_user, only: [:edit, :update, :destroy]

  def index
    @sites = Site.all
  end

  def show
  end

  def new
    @site = Site.new
  end

  def edit
  end

  def create
    @site = current_user.sites.build(site_params)
    if @site.save
      redirect_to @site, notice: "Good job you created a new site!!"
    else
      render action: 'new'
    end
  end

  def update
    if @site.update(site_params)
      redirect_to @site, notice: "Good job updating, you sexy bitch!"
    else
      render action: 'edit'
    end
  end

  def destroy
    @site.destroy
    redirect_to sites_url
  end

  private
    def set_site
      @site = Site.find(params[:id])
    end

    def correct_user
      @site = current_user.sites.find_by(id: params[:id])
      redirect_to sites_path, notice: "Not authorized to edit this Site" if @site.nil?
    end

    def site_params
      params.require(:site).permit(:description, :lat, :lon, :city, :state, :cost, :url,
                                   :lead_time, :style, :amenities, :image)
    end
end
