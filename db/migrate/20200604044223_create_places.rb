class CreatePlaces < ActiveRecord::Migration[5.2]
  def change
    create_table :places do |t|
      t.string :image_id
      t.string :placename
      t.text :explanation
      t.string :area
      t.string :type
      t.integer :admiration_startmonth
      t.string :admiration_startseason
      t.integer :admiration_finishmonth
      t.string :admiration_finishseason
      t.string :address
      t.string :tel
      t.string :officialsite
      t.string :parking
      t.string :access_car
      t.string :access_public
      t.string :event
      t.integer :event_startmonth
      t.integer :event_startday
      t.integer :event_finishmonth
      t.integer :event_finishday
      t.float :longitude
      t.float :latitude

      t.timestamps
    end
  end
end
