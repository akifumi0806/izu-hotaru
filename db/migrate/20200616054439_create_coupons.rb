class CreateCoupons < ActiveRecord::Migration[5.2]
  def change
    create_table :coupons do |t|
      t.integer :user_id
      t.integer :place_id
      t.string :shopname
      t.string :item
      t.text :annotation
      t.integer :discount
      t.integer :deadline

      t.timestamps
    end
  end
end
