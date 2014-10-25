class CreateDirections < ActiveRecord::Migration
  def change
    create_table :directions do |t|
      t.string :tag, null: false
      t.string :title, null: false
      t.string :name, null: false
      t.belongs_to :route, null: false

      t.timestamps
    end
  end
end
