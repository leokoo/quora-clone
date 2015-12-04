class CreateQuestion < ActiveRecord::Migration
	def change
		create_table :questions do |t|
			t.string :question
			t.integer :user_id
			t.timestamps null: false

	end
end
