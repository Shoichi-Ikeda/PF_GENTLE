# frozen_string_literal: true

class CreateCheers < ActiveRecord::Migration[5.2]
  def change
    create_table :cheers do |t|
      t.integer :user_id
      t.integer :wine_id

      t.timestamps
    end
  end
end
