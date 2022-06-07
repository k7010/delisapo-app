class CreateBaggages < ActiveRecord::Migration[6.0]
  def change
    create_table :baggages do |t|
      t.string  :address,       null: false
      t.string  :building
      t.string  :block,         null: false
      t.string  :family_name,   null: false
      t.string  :first_name,    null: false
      t.references  :user,      null: false, foreign_key: true
      t.string  :time_specification, null: false
      t.timestamps
    end
  end
end
