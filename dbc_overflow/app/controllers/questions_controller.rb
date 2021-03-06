class QuestionsController < ApplicationController

  def index
    @questions = Question.all
    @response = HTTParty.get('https://api.github.com/zen')
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
    @question.votecount += params[:amount].to_i
    @question.save
    # @question.increment! :votecount
    render json: { votecount: @question.votecount, qs_id: @question.id }
  end

  def downvote
    @question = Question.find(params[:id])
    @question.decrement! :votecount
    render json: { votecount: @question.votecount, qs_id: @question.id }
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
