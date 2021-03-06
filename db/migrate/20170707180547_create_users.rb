class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.column :admin, :boolean, default: false
      t.column :avatar, :string
      t.column :user_name, :string
      t.column :email, :string
      t.column :password_hash, :string
      t.column :password_salt, :string
      t.timestamps
    end
  end
end
