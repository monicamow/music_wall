class AddVotes < ActiveRecord::Migration
  def change

    create_table "votes", force: :cascade do |t|
      t.references :track
      t.references :user
      t.timestamps
    end  

  end
end
