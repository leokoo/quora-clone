class CreateAnswerVote < ActiveRecord::Migration
	def change
		create_table :answer_votes do |t|
			t.integer :vote_count
			t.belongs_to :answer, index: true
			t.belongs_to :user, index: true
			t.timestamps null: false
		end
	end
end