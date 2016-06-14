class AddVoteCountToTracks < ActiveRecord::Migration
  def change
    add_column :tracks, :vote_count, :integer, default: 0
  end
end
