class User < ActiveRecord::Base

  has_many :votes
  has_many :tracks


  # make validationg for user only being able to vote once for one track
  # get all users votes...check to see if the track is in there

  
end