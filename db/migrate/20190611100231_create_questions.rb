class CreateQuestions < ActiveRecord::Migration[5.2]
	def change
		create_table :questions do |t|
			t.string :school_name
			t.string :school_city
			t.string :email
			t.string :question_content
			t.timestamps
		end
	end
end
