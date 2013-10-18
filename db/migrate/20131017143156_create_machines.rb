class CreateMachines < ActiveRecord::Migration
  def change
    create_table :machines do |t|
      t.references :category, index: true
      t.references :user, index: true
      t.string :name, :null => false
      t.string :location, :null => false
      t.integer :charge, :null => false
      t.integer :driver_charge
      t.text :description
      t.hstore :specification
      t.boolean :active, :null => false, :default => true

      t.timestamps
    end
  end
end
