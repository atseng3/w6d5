class FriendshipsController < ApplicationController
  def create
    sleep(2)

    @friendship = Friendship.new({in_friend_id: current_user.id,
                                  out_friend_id: params[:user_id]})
    @friendship.save!
    render :json => @friendship
  end

  def destroy

    @friendship = Friendship.find_by_out_friend_id_and_in_friend_id(
                              params[:user_id], current_user.id)
    @friendship.destroy
    puts "inside delete"
    head :ok
  end

end
