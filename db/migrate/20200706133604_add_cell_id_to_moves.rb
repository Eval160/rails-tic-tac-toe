class AddCellIdToMoves < ActiveRecord::Migration[6.0]
  def change
    add_column :moves, :cell_id, :integer
  end
end
