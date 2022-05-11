class CreateCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|
      t.string :name
      t.boolean :permanent
      t.integer :par
      t.integer :difficulty

      t.timestamps
    end
  end
end
