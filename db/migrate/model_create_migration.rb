class CreateVote < ActiveRecord::Migration
	def change
		create_table :votes do |t|
			t.integer :vote_count
			t.integer :user_id
			t.integer :question_id, index: true, foreign_key: true
			t.timestamps null: false

			t.belongs_to :question, index: true
			t.references :question, index:true
		end
	end
end
