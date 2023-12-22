class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_digest

      t.timestamps null: false
    end
  end
end