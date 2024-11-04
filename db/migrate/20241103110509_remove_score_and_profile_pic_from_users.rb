class RemoveScoreAndProfilePicFromUsers < ActiveRecord::Migration[7.2]
  def change
    remove_column :users, :profile_picture, :string
    remove_column :users, :score, :integer
  end
end
