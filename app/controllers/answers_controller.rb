class AnswersController < ApplicationController

  def index
    @answerable = find_answerable
    @answers = @answerable.answers
  end

  def new
    @answerable = find_answerable
  end

  def show
    @answer = Answer.find(params[:id])
    @question = Question.find(params[:id])
    @answerable = @question
    @answers = @answerable.answers

  end

  def create
    @answerable = find_answerable
    @answer = @answerable.answers.build(answer_params)
    if @answer.save
      respond_to do |format|
      format.html { redirect_to get_master }
      format.js
    end

    else
      render 'new'
    end
  end

private
  def answer_params
    params.require(:answer).permit(:an_answer)
  end

  def find_answerable
    params.each do |name, value|
      if name =~ /(.+)_id$/
        return $1.classify.constantize.find(value)
      end
    end
    nil
  end

  def get_master
    @parent = @answer.answerable
    if @parent.respond_to?('answerable_type')
      @answer = @parent
      get_master
    else
      return @parent
    end
  end
end
