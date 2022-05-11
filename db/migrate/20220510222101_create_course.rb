class CreateCourse < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|
      t.string :name
      t.timestamp :created_at
      t.timestamp :updated_at
      t.boolean :permanent
      t.integer :par
      t.integer :difficulty
    end
  end
end
