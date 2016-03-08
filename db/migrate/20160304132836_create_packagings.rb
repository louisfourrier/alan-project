class CreatePackagings < ActiveRecord::Migration
  def change
    create_table :packagings do |t|
      t.references :package, index: true
      t.references :user, index: true
      t.float :refund_percent

      t.timestamps null: false
    end
    add_foreign_key :packagings, :packages
    add_foreign_key :packagings, :users
  end
end
