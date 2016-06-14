class Track < ActiveRecord::Base

  # scope :count_votes, -> { 
  #   order('vote_count DESC')
  # }

  validates :song_title,
    presence: true

  validates :author,
    presence: true

  has_many :votes
  has_many :reviews
  belongs_to :user

end