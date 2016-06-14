class Vote < ActiveRecord::Base

  # failed scope/class method
  #belongs_to :track, counter_cache: true

  belongs_to :track
  belongs_to :user

  validate :one_vote_per_user, on: :create

  def one_vote_per_user
    current_user = User.find(self.user_id)
    users_votes = current_user.votes

    current_track = self.track_id

    if users_votes.exists?(track_id: current_track)
      errors.add(:base, "you voted on this track already")
    end

  end


end