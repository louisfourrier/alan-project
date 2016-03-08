class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.references :user, index: true
      t.date :emission_date
      t.date :begin_date
      t.date :end_date
      t.float :amount_ht
      t.float :amount_ttc
      t.boolean :paid_status

      t.timestamps null: false
    end
    add_foreign_key :invoices, :users
  end
end
