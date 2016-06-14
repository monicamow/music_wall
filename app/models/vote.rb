class Vote < ActiveRecord::Base

  belongs_to :track
  belongs_to :user

  # make validationg for user only being able to vote once for one track

  # get all users votes...check to see if the track is in there

end