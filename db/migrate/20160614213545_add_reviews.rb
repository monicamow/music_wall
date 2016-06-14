class AddReviews < ActiveRecord::Migration
  def change

    create_table "reviews", force: :cascade do |t|
      t.references :track
      t.references :user
      t.timestamps
    end  

  end
end
