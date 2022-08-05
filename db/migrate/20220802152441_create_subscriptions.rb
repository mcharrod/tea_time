class CreateSubscriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :subscriptions do |t|
      t.references :tea, foreign_key: true
      t.references :user, foreign_key: true
      t.string :title
      t.integer :frequency
      t.integer :price
      t.string :status

      t.timestamps
    end
  end
end
