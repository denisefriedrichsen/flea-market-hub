class AddStatusToSpots < ActiveRecord::Migration[5.2]
  def change
    add_column :spots, :status, :string, default: "available"
  end
end
