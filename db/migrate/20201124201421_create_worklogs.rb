class CreateWorklogs < ActiveRecord::Migration[6.0]
  def change
    create_table :worklogs do |t|
      t.string :comment
      t.integer :time_type
      t.datetime :starting_at
      t.datetime :ending_at

      t.timestamps
    end
  end
end
