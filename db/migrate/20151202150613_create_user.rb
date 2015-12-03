class CreateUser < ActiveRecord::Migration
	def change
		create_table :users do |t|
			t.string :name
			t.string :email
			t.string :encrypted_password
			t.string :bio

			t.timestamps null: false
		end
	end
end