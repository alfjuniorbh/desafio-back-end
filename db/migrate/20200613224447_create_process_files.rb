class CreateProcessFiles < ActiveRecord::Migration[6.0]
  def change
    create_table :process_files do |t|
      t.integer :type_transaction
      t.date :date
      t.decimal :value
      t.string :cpf
      t.string :card
      t.datetime :time
      t.string :owner
      t.string :shop

      t.timestamps
    end
  end
end
