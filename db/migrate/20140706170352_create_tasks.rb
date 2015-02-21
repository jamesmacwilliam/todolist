class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.belongs_to :project
      t.string :title
      t.text :note
      t.datetime :completed

      t.timestamps
    end
  end
end
