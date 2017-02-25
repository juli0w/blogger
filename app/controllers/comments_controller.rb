class CommentsController < ApplicationController
  def create
    @blog =  Blogger.find_by_slug(params[:blogger_id])
    @article = @blog.articles.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    redirect_to blogger_article_path(@blog, @article)
  end

  private

  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end
end
