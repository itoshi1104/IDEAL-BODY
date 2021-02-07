class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.integer :user_id
      t.text :title
      t.text :body
      t.datetime :start_date
      t.datetime :end_date

      t.timestamps
    end
  end
end
