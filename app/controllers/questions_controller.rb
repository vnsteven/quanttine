class QuestionsController < ApplicationController
def new
	
end

	def create
		@question = Question.create!(questions_parameters)
		if @question.save
			redirect_to root_path
		end
	end

	def questions_parameters
    params.require(:question).permit(:school_name, :school_city, :email, :question_content)
  end

end
