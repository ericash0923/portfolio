class CreateCredentials < ActiveRecord::Migration[5.0]
  def change
    create_table :credentials do |t|
      t.string :title
      t.string :subtitle
      t.string :body
      t.text :main_image
      t.text :thumb_image

      t.timestamps
    end
  end
end
