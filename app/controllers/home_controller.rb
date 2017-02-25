class HomeController < ApplicationController
  def index
    if params[:slug].present?
      @blog =  Blogger.find_by_slug(params[:slug])
      @articles = @blog.articles

      render 'articles/index'
    else
      redirect_to admin_setup_path
    end
  end
end
