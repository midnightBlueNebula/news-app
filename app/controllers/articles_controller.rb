class ArticlesController < ApplicationController
  before_action :set_article, only: [:edit, :show, :destroy]
  before_action :only_authors, only: [:new, :create, :edit,
                                                    :update]
  before_action :only_admins, only: [:destroy]
  

  def new
    @article = Article.new
  end

  def create
    @article = current_user.articles.build(article_params)

    if @article.save
    else
    end
  end

  def edit
  end

  def update
    if @article.update_attributes(article_params)
    else
    end
  end

  def show
  end

  def destroy
    if @article.delete
    else
    end
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :content)
  end

  def only_authors
    back_or_root unless current_user.author?
  end

  def only_admins
    back_or_root unless current_user.admin?
  end
end
