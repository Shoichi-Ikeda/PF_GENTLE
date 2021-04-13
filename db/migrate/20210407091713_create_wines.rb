class CreateWines < ActiveRecord::Migration[5.2]
  def change
    create_table :wines do |t|
      t.string :wine_image_id
      t.string :wine_name
      t.string :type
      t.string :country
      t.string :variety
      t.string :vintage
      t.string :price
      t.string :rating

      t.timestamps
    end
  end
end
