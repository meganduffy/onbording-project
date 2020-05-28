class ArticlesController < ApplicationController
  before_action :require_user, only: [:new, :create, :edit, :update]

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to '/'
      flash[:success] = 'Article created successfully!'
    else
      render 'new'
    end
  end

  def index
    @articles = Article.kept.order(created_at: :desc).includes(:user).as_json(include: { user: { only: [:first_name] } })
  end

  def show
    @article = Article.find(params[:id])
  end

  def edit 
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
  
    if @article.update(article_params)
      redirect_to articles_path
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.discard

    redirect_to articles
  end

  def recover
    @article = Article.find(params[:id])
    @article.undiscard

    redirect_back(fallback_location: root_path)
  end

private

  def article_params
    params.require(:article).permit(:title, :content).merge(user_id: current_user.id)
  end
end
