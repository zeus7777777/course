class CreateMycourses < ActiveRecord::Migration
  def change
    create_table :mycourses do |t|
      t.string :name
      t.string :teacher
      t.string :location
      t.string :time
      t.integer :credit

      t.timestamps null: false
    end
  end
end
