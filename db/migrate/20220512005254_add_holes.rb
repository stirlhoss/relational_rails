class AddHoles < ActiveRecord::Migration[5.2]
  def change
    create_table :holes do |t|
      t.string :name
      t.integer :distance_to_pin
      t.integer :par
      t.boolean :permanent
      t.references :course, foreign_key: true

      t.timestamps
    end
  end
end
