class AddCostToSpaceships < ActiveRecord::Migration[6.0]
  def change
    add_column :spaceships, :cost, :integer
  end
end
