class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :account
      t.string :password
      t.string :payment_account

      t.timestamps
    end
  end
end
