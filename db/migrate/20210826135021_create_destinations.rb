class CreateDestinations < ActiveRecord::Migration[6.0]
  def change
    create_table :destinations do |t|
      t.string :name
      t.integer :flight_time
      t.string :image_url

      t.timestamps
    end
  end
end
