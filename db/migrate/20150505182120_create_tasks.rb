class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title
      t.boolean :complete, default: false
      t.text :description
      t.datetime :due_date
      t.references :list, index: true

      t.timestamps null: false
    end
  end
end
