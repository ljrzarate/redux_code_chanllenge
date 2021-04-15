class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      user_id: belongs_to
      post_id: belongs_to
      t.timestamps
    end
  end
end
