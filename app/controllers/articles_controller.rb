class ArticlesController < ApplicationController

  def index
    viewing_user = User.find session[:user_id]
    if viewing_user.username == "Kyle.Lanier"
      @user_articles = Article.all
      @admin_user = true
    else
      user_id = session[:user_id]
      @user_articles = User.find(user_id).articles
      @admin_user = false
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
  end

  def create
    @article = Article.new(article_params)
    @article.user_id = session[:user_id]

    created_by = User.find_by_id(session[:user_id])
    @article.creator_username = created_by.username

    #@article.creator_username = Article.all.map {|article| article.user}

    @article.save
    redirect_to @article
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update_attributes(article_params)
      redirect_to articles_path, :notice => "Message updated successfully"
    else
      render "edit"
    end
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
