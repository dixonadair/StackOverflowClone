class AnswersController < ApplicationController
  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.create(answer_params)
    redirect_to question_path(@question)
  end

  def new
  end

  def upvote
    @question = Question.where(id: params[:question_id]).first
    @answer = Answer.where(id: params[:id]).first
    @answer.votecount+=1
    @answer.save
    redirect_to "/questions/#{@question.id}"
  end

  def downvote
    @question = Question.where(id: params[:question_id]).first
    @answer = Answer.where(id: params[:id]).first
    @answer.votecount-=1
    @answer.save
    redirect_to "/questions/#{@question.id}"
  end

  private
    def answer_params
      params.require(:answer).permit(:answerer, :title, :content)
    end
end
