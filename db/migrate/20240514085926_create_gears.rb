class CreateGears < ActiveRecord::Migration[7.0]
  def change
    create_table :gears do |t|
      t.string     :name,                   null: false
      t.text       :info,                   null: false
      t.integer    :brand_id,               null: false
      t.integer    :category_id,            null: false
      t.integer    :price,                  null: false
      t.references :user,                null: false, foreign_key: true
      t.timestamps
    end
  end
end
