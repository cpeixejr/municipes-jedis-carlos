class CreateAddresses < ActiveRecord::Migration[7.1]
  def change
    create_table :addresses do |t|
      t.string :zip_code
      t.string :street
      t.string :secondary_address
      t.string :neighborhood
      t.string :city
      t.string :state
      t.string :ibge_code
      t.references :resident, foreign_key: true

      t.timestamps
    end
  end
end
