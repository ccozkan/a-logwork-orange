class CreateWorklogs < ActiveRecord::Migration[6.0]
  def change
    create_table :worklogs do |t|
      t.string :remark
      t.integer :time_type
      t.datetime :starting_at
      t.datetime :ending_at
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
