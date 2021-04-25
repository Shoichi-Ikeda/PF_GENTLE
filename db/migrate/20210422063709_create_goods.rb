# frozen_string_literal: true

class CreateGoods < ActiveRecord::Migration[5.2]
  def change
    create_table :goods, &:timestamps
  end
end
