class AddPositionToCredential < ActiveRecord::Migration[5.0]
  def change
    add_column :credentials, :position, :integer
  end
end
