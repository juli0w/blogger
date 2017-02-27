class CommentsController < ApplicationController
  def create
    @blog =  Blogger.find_by_slug(params[:blogger_id])
    @article = @blog.articles.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    redirect_to blogger_article_path(@blog, @article)
  end

  def destroy
    @blog =  Blogger.find_by_slug(params[:blogger_id])
    if @blog.owner?(current_user)
      @article = @blog.articles.find(params[:article_id])
      @comment = @article.comments.find(params[:id])
      @comment.delete
      redirect_to blogger_article_path(@blog, @article)
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end
end
