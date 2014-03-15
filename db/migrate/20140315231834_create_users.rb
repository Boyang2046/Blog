class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :password
      t.string :username
      t.string :user_type
      t.boolean :locked
      
      t.timestamps
    end
    
    add_reference :posts, :user, index: true
  end
end
