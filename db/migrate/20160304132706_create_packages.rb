class CreatePackages < ActiveRecord::Migration
  def change
    create_table :packages do |t|
      t.string :name
      t.float :month_cost

      t.timestamps null: false
    end
  end
end
