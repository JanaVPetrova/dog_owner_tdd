class AdminController < ApplicationController
  def index
    @posts = Post.find_all_by_status(false)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
    end
  end
end
