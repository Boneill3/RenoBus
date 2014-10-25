class CreateDirectionStops < ActiveRecord::Migration
  def change
    create_table :direction_stops do |t|
      t.belongs_to :direction, index: true, null: false
      t.belongs_to :stop, index: true, null: false

      t.timestamps
    end
  end
end
