class CreateCountries < ActiveRecord::Migration[7.1]
  def change
    create_table :countries do |t|
      t.string :name
      t.string :alpha_2_code
      t.string :alpha_3_code
      t.string :currency

      t.timestamps
    end
  end
end
