class ChangeEmployeeDefault < ActiveRecord::Migration
  def change
    change_column_default(:employees, :complete_information, false)
  end
end
