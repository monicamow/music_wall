class RemoveVoteCountFromTracks < ActiveRecord::Migration
  def change
    remove_column :tracks, :vote_count
  end
end
