class CreateLegalInformations < ActiveRecord::Migration
  def change
    create_table :legal_informations do |t|
      t.string :name
      t.text :short_description
      t.text :content
      t.datetime :publication_date

      t.timestamps null: false
    end
  end
end
