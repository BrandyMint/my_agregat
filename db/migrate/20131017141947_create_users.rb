class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, :null=>false
      t.string :phone,:null=>false
      t.string :password, :null=>false
      t.datetime :sms_sended_at

      t.timestamps
    end
    add_index :users, :phone, :unique => true
  end
end
