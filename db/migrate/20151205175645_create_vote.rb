class CreateVote < ActiveRecord::Migration
	def change
		create_table :votes do |t|
			t.integer :upvote
			t.integer :downvote
			t.integer :vote_count
			t.integer :question_id
			t.integer :user_id
			t.timestamps null: false
		end
	end
end
