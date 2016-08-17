class ArticlesController < ApplicationController

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
  end

  def create
    @article = Article.new(article_params)
    @article.user_id = session[:user_id]
    @article.save
    redirect_to @article
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    respond_to do |format|
      format.html { redirect_to @article }
      format.json { head :ok }
    end
  end

  private
    def article_params
      params.require(:article).permit(:title, :text)
    end

end
