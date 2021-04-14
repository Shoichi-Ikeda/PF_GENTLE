class AddColumnsToWines < ActiveRecord::Migration[5.2]
  def change
    add_column :wines, :user_id, :string
  end
end
