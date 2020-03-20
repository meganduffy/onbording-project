class ArticlesController < ApplicationController

  before_action :require_user

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to '/'
    else
      render 'new'
    end
  end

  private
  def article_params
    params.require(:article).permit(:title, :content).merge(user_id: current_user.id)
  end
end
