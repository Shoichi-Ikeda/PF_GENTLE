# frozen_string_literal: true

class RenameTypeColumnToWines < ActiveRecord::Migration[5.2]
  def change
    rename_column :wines, :type, :kind
  end
end
