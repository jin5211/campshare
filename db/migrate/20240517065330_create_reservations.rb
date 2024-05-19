class CreateReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations do |t|
      t.references :order,         null: false, foreign_key: true
      t.date       :start_date,    null: false
      t.date       :end_date,      null: false
      t.string     :name,          null: false
      t.string     :address,       null: false
      t.string     :phone_number,  null: false
      t.timestamps
    end
  end
end
