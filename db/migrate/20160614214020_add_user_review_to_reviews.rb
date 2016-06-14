class AddUserReviewToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :user_review, :text
  end
end
