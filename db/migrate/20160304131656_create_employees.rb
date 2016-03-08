class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :first_name
      t.string :last_name
      t.references :user, index: true
      t.date :birthday_date
      t.text :health_comment
      t.integer :admin_status
      t.boolean :complete_information

      t.timestamps null: false
    end
    add_foreign_key :employees, :users
  end
end
