class CreateDeliveries < ActiveRecord::Migration[6.0]
  def change
    create_table :deliveries do |t|
      t.references :user,         null: false, foreign_key: true
      t.references :baggage,      null: false, foreign_key: true
      t.string :delivery_result,  null: false
      t.timestamps
    end
  end
end
