class CommentsController < ApplicationController
  before_action :only_users, [:create, :voting]
  before_action :only_commenter, [:update]
  before_action :only_admins, [:destroy]


  def create
  end

  def update
  end

  def destroy
  end

  def voting
  end

  private
  
  def set_comment
    @comment = Comment.find(params[:id])
  end

  def only_users
    back_or_root unless current_user.logged_in?
  end

  def only_commenter
    back_or_root unless current_user?(set_comment.user)
  end

  def only_admins
    back_or_root unless current_user.admin?
  end
end
