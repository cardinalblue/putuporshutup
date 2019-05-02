class CreateTransactions < ActiveRecord::Migration[5.1]
  def change
    create_table :transactions do |t|
      t.references :event
      t.references :attendee
      t.integer :status_after
      t.integer :status_before

      t.timestamps
    end
  end
end
