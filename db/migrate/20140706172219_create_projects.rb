class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.belongs_to :user
      t.string :title
      t.text :note
      t.date :completed

      t.timestamps
    end
  end
end
