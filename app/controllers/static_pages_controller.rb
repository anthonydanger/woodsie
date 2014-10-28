class StaticPagesController < ApplicationController
  def home
  	@sites = Site.all
  end
end
