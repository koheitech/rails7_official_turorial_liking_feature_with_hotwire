require "test_helper"

class LikesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @micropost = microposts(:orange)
    @user = users(:michael)
    log_in_as(@user)
  end

  test "should like a micropost" do
    assert_difference 'Like.count', 1 do
      post like_micropost_path(@micropost)
    end
    assert_redirected_to @micropost
  end

  test "should unlike a micropost" do
    @micropost.likes.create(user: @user)
    assert_difference 'Like.count', -1 do
      delete unlike_micropost_path(@micropost)
    end
    assert_redirected_to @micropost
  end
end
