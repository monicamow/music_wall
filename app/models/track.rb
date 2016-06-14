class Track < ActiveRecord::Base

  validates :song_title,
    presence: true

  validates :author,
    presence: true

  has_many :votes
  belongs_to :user

end