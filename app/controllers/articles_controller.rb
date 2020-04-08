class ArticlesController < ApplicationController
  before_action :require_user, only: [:new, :create]

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to '/'
      flash[:success] = "Article created successfully!"
    else
      render 'new'
    end
  end

  def index
    @articles = Article.order(created_at: :desc)
  end

private

  def article_params
    params.require(:article).permit(:title, :content).merge(user_id: current_user.id)
  end
end
