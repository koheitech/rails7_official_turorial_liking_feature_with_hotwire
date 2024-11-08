class LikesController < ApplicationController
  before_action :find_micropost

  def like
    @micropost.likes.create(user: current_user)
    render_update_turbo_stream
  end

  def unlike
    @micropost.likes.find_by(user: current_user)&.destroy
    render_update_turbo_stream
  end

  private

  def find_micropost
    @micropost = Micropost.find(params[:id])
  end

  def render_update_turbo_stream
    respond_to do |format|
      format.turbo_stream { render 'likes/update' }
    end
  end
end
