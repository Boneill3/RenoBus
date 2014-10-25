class CreatePaths < ActiveRecord::Migration
  def change
    create_table :paths do |t|
      t.belongs_to :route, null: false

      t.timestamps
    end
  end
end
