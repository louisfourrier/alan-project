class CompleteUserFields < ActiveRecord::Migration
  def change
    add_column :users, :company_name, :string
    add_column :users, :company_domain, :string
    add_column :users, :company_address, :string
    add_column :users, :company_phone, :string
  end
end
