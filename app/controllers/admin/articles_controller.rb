module Admin
  class ArticlesController < Admin::ApplicationController
    def index
      @blog = current_user.blogger
      @articles = @blog.articles
    end

    def new
      @blog = current_user.blogger
      @article = @blog.articles.new
    end

    def create
      @article = current_user.articles.new(article_param)

      if @article.save
        flash[:success] = "Artigo criado!"
        redirect_to admin_articles_path
      else
        flash.now[:alert] = "Preencha os campos corretamente"
        render :new
      end
    end

    def edit
      @blog = current_user.blogger
      @article = current_user.articles.find(params[:id])
    end

    def update
      @article = current_user.articles.find(params[:id])

      if @article.update(article_param)
        flash[:success] = "Artigo editado!"
        redirect_to admin_articles_path
      else
        flash.now[:alert] = "Preencha os campos corretamente"
        render :new
      end
    end

    private

    def article_param
      params.require(:article).permit(:name, :description, :content, :cover, :tag_list)
    end
  end
end
