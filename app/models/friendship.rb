class Friendship < ActiveRecord::Base
  attr_accessible :in_friend_id, :out_friend_id
  validates :in_friend_id, :out_friend_id, presence: true

  belongs_to(
    :in_friend,
    class_name: "User",
    foreign_key: :in_friend_id)

  belongs_to(
    :out_friend,
    class_name: "User",
    foreign_key: :out_friend_id)

  def self.can_friend?(out_friend_id, in_friend_id)
    if Friendship.exists?(:out_friend_id => out_friend_id,
                          :in_friend_id => in_friend_id)
      return false
    elsif out_friend_id == in_friend_id
      return false
    else
      return true
    end
  end

  def self.can_unfriend?(out_friend_id, in_friend_id)
    # if Friendship.exists?(:out_friend_id => out_friend_id,
    #                       :in_friend_id => in_friend_id)
    return Friendship.find_by_out_friend_id_and_in_friend_id(
                          out_friend_id, in_friend_id)
  end
end
