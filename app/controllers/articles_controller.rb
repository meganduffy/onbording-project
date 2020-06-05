class ArticlesController < ApplicationController
  before_action :require_user, only: [:new, :create, :edit, :update, :delete, :recover]

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to articles_path
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
    if current_user
      @article = Article.find(params[:id])
      @article.discard

      flash[:notice] = "You're about to delete #{@article.title.upcase} #{view_context.link_to 'undo', recover_path}".html_safe

      render 'show'
    else
      redirect_to login_path
    end
  end

  def recover
    @article = Article.find(params[:id])
    @article.undiscard

    flash[:notice] = "The article #{@article.title.upcase} has now been restored!".html_safe

    redirect_to articles_path
  end

private

  def article_params
    params.require(:article).permit(:title, :content).merge(user_id: current_user.id)
  end
end
