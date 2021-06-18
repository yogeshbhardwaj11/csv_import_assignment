class QuestionsController < ApplicationController
  def index
  	@questions = Question.all
  end

  def import
   redirect_to questions_path, notice: QuestionImport.new(params[:file]).call.result
  end
end