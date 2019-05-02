class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :title
      t.string :description
      t.string :map_url
      t.float :price_per_person
      t.boolean :refundable
      t.datetime :start_time
      t.datetime :end_time, null: true
      t.datetime :deadline, null: true
      t.references :host, index: true

      t.timestamps
    end
  end
end
