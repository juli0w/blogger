class ArticlesController < ApplicationController
  def index
    @blog =  Blogger.find_by_slug(params[:blogger_id])
    @articles = @blog.articles
  end

  def show
    @blog =  Blogger.find_by_slug(params[:blogger_id])
    @article = @blog.articles.find(params[:id])
  end
end
