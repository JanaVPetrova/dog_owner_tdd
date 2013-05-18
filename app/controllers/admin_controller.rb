class AdminController < ApplicationController
  authorize_resource :class => false
  def index
    @posts = Post.find_all_by_status(false)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
    end
  end

  def create
    @admin = User.find_by_id(params[:id])
    @admin.update_attribute(:admin, true)
  end
end
