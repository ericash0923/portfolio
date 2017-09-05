class AddImageToTopic < ActiveRecord::Migration[5.0]
  def change
    add_column :topics, :image, :text
  end
end
