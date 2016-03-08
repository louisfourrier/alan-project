class AddResearchAndTokenToEmployees < ActiveRecord::Migration
  def change
    add_column :employees, :research_name, :string
    add_column :employees, :email, :string
    add_column :employees, :access_token, :string
  end
end
