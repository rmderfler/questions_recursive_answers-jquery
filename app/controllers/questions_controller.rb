class QuestionsController < ApplicationController
  before_filter :authorize, only: [:show, :update, :destroy]

  def index
    if params[:query].blank?
      @questions = Question.all
      @answers = Answer.all

    else
    @questions = Question.advanced_search(a_question: params[:query])

    end
    if params[:answer_query].blank?
      @answers = Answer.all

    else
      @answers = Answer.advanced_search(an_answer: params[:answer_query])

    end
  end

  def new
    @question = Question.new
  end

  def show
    @question = Question.find(params[:id])
    @answerable = @question
    @answers = @answerable.answers
    @answer = Answer.new
  end

  def create
    @question = Question.new(user_params)
    @question.user_id = current_user.id
    if @question.save
      flash[:notice] = "Question was added"
      redirect_to questions_path
    else
      render 'new'
    end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    if @question.update(user_params)
      flash[:notice] = "Question updated."
      redirect_to questions_path(@question)
    else
      render 'edit'
    end
  end

  def destroy
    current_user
    @question = Question.find(params[:id])
    if @question.destroy
      flash[:notice] = "The question was deleted."
      redirect_to questions_path
    end
  end

  private
    def user_params
      params.require(:question).permit(:a_question, :user_id)
    end
end
