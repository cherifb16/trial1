class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :content
      t.integer :status, null: false, default: 1
      t.datetime :expired_at, :datetime, null: false, default: -> { "now() + cast( '1 months' as INTERVAL )" }
      t.integer :priority, null: false, default: 1

      t.timestamps
    end
    add_index :tasks, :title
  end
end
