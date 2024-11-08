class LikesController < ApplicationController
  before_action :find_micropost

  def like
      @micropost.likes.create(user: current_user)
      redirect_to @micropost
  end

  def unlike
      @micropost.likes.find_by(user: current_user).destroy
      redirect_to @micropost
  end

  private

  def find_micropost
      @micropost = Micropost.find(params[:id])
  end
end
