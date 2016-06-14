class Track < ActiveRecord::Base

  # scope :count_votes, -> { 
  #   order('vote_count DESC')
  # }

  validates :song_title,
    presence: true

  validates :author,
    presence: true

  has_many :votes
  belongs_to :user

end