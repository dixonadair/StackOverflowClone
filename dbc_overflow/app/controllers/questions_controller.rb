class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def show
    @question = Question.find(params[:id])
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])

    if @question.update(question_params)
      redirect_to questions_path
    else
      render 'edit'
    end
  end

  def upvote
    @question = Question.find(params[:id])
    @question.votecount+=1
    @question.save
    redirect_to questions_path
  end

  def downvote
    @question = Question.find(params[:id])
    @question.votecount-=1
    @question.save
    redirect_to questions_path
  end

  def create
    # render plain: params[:question].inspect # this is a debugging tool
    @question = Question.new(question_params)
    if @question.save
      redirect_to questions_path
    else
      render 'new'
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy

    redirect_to questions_path
  end

  private
    def question_params
      params.require(:question).permit(:title, :content)
    end
end
