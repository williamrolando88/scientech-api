class RenameLinesToLine < ActiveRecord::Migration[7.0]
  def change
    rename_column :brands, :lines_id, :line_id
  end
end
