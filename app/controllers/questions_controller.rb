class QuestionsController < ApplicationController
	before_action :set_question, only: [:show, :update, :destroy]

  # GET /questions
  def index
    if params[:pattern_multi] != nil and params[:age_range] != nil and params[:question_type] != nil and params[:gender] != nil and params[:category] != nil
      @questions = Question.where("pattern_multi = ? AND age_range = ? AND question_type = ? AND gender = ? AND category = ?", params[:pattern_multi], params[:age_range], params[:question_type], params[:gender], params[:category])
    elsif params[:pattern_multi] != nil and params[:age_range] != nil and params[:question_type] != nil and params[:gender] != nil
      @questions = Question.where("pattern_multi = ? AND age_range = ? AND question_type = ? AND gender = ?", params[:pattern_multi], params[:age_range], params[:question_type], params[:gender])
    elsif params[:category] != nil and params[:pattern_multi] != nil and params[:question_type] != nil and params[:gender] != nil
      @questions = Question.where("category = ? AND pattern_multi = ? AND question_type = ? AND gender = ?", params[:category], params[:pattern_multi], params[:question_type], params[:gender])
    elsif params[:category] != nil and params[:age_range] != nil and params[:pattern_multi] != nil and params[:gender] != nil
      @questions = Question.where("category = ? AND age_range = ? AND pattern_multi = ? AND gender = ?", params[:category], params[:age_range], params[:pattern_multi], params[:gender])
    elsif params[:category] != nil and params[:age_range] != nil and params[:question_type] != nil and params[:pattern_multi] != nil
      @questions = Question.where("category = ? AND age_range = ? AND question_type = ? AND pattern_multi = ?", params[:category], params[:age_range], params[:question_type], params[:pattern_multi])
    elsif params[:category] != nil and params[:age_range] != nil and params[:question_type] != nil and params[:gender] != nil
      @questions = Question.where("category = ? AND age_range = ? AND question_type = ? AND gender = ?", params[:category], params[:age_range], params[:question_type], params[:gender])
    elsif params[:category] != nil and params[:age_range] != nil and params[:question_type] != nil
      @questions = Question.where("category = ? AND age_range = ? AND question_type = ?", params[:category], params[:age_range], params[:question_type])
    elsif params[:gender] != nil and params[:age_range] != nil and params[:question_type] != nil
      @questions = Question.where("gender = ? AND age_range = ? AND question_type = ?", params[:gender], params[:age_range], params[:question_type])
    elsif params[:pattern_multi] != nil and params[:age_range] != nil and params[:question_type] != nil
      @questions = Question.where("pattern_multi = ? AND age_range = ? AND question_type = ?", params[:pattern_multi], params[:age_range], params[:question_type])
    elsif params[:gender] != nil and params[:category] != nil and params[:question_type] != nil
      @questions = Question.where("gender = ? AND category = ? AND question_type = ?", params[:gender], params[:category], params[:question_type])
    elsif params[:pattern_multi] != nil and params[:category] != nil and params[:question_type] != nil
      @questions = Question.where("pattern_multi = ? AND category = ? AND question_type = ?", params[:pattern_multi], params[:category], params[:question_type])
    elsif params[:gender] != nil and params[:pattern_multi] != nil and params[:question_type] != nil
      @questions = Question.where("gender = ? AND pattern_multi = ? AND question_type = ?", params[:gender], params[:pattern_multi], params[:question_type])
    elsif params[:gender] != nil and params[:category] != nil and params[:age_range] != nil
      @questions = Question.where("gender = ? AND category = ? AND age_range = ?", params[:gender], params[:category], params[:age_range])
    elsif params[:pattern_multi] != nil and params[:category] != nil and params[:age_range] != nil
      @questions = Question.where("pattern_multi = ? AND category = ? AND age_range = ?", params[:pattern_multi], params[:category], params[:age_range])
    elsif params[:gender] != nil and params[:pattern_multi] != nil and params[:age_range] != nil
      @questions = Question.where("gender = ? AND pattern_multi = ? AND age_range = ?", params[:gender], params[:pattern_multi], params[:age_range])
    elsif params[:gender] != nil and params[:category] != nil and params[:pattern_multi] != nil
      @questions = Question.where("gender = ? AND category = ? AND pattern_multi = ?", params[:gender], params[:category], params[:pattern_multi])
    elsif params[:gender] != nil and params[:category] != nil
      @questions = Question.where("gender = ? AND category = ?", params[:gender], params[:category])
    elsif params[:gender] != nil and params[:pattern_multi] != nil
      @questions = Question.where("gender = ? AND pattern_multi = ?", params[:gender], params[:pattern_multi])
    elsif params[:age_range] != nil and params[:category] != nil
      @questions = Question.where("age_range = ? AND category = ?", params[:age_range], params[:category])
    elsif params[:age_range] != nil and params[:gender] != nil
      @questions = Question.where("age_range = ? AND gender = ?", params[:age_range], params[:gender])
    elsif params[:age_range] != nil and params[:pattern_multi] != nil
      @questions = Question.where("age_range = ? AND pattern_multi = ?", params[:age_range], params[:pattern_multi])
    elsif params[:question_type] != nil and params[:age_range] != nil
      @questions = Question.where("question_type = ? AND age_range = ?", params[:question_type], params[:age_range])
    elsif params[:question_type] != nil and params[:gender] != nil
      @questions = Question.where("question_type = ? AND gender = ?", params[:question_type], params[:gender])
    elsif params[:question_type] != nil and params[:category] != nil
      @questions = Question.where("question_type = ? AND category = ?", params[:question_type], params[:category])
    elsif params[:pattern_multi] != nil and params[:category] != nil
      @questions = Question.where("pattern_multi = ? AND category = ?", params[:pattern_multi], params[:category])
    elsif params[:question_type] != nil and params[:pattern_multi] != nil
      @questions = Question.where("question_type = ? AND pattern_multi = ?", params[:question_type], params[:pattern_multi])
    elsif params[:pattern_multi] != nil
      @questions = Question.where("pattern_multi = ?", params[:pattern_multi])
    elsif params[:gender] != nil
      @questions = Question.where("gender = ?", params[:gender])
    elsif params[:age_range] != nil
      @questions = Question.where("age_range = ?", params[:age_range])
    elsif params[:question_type] != nil
      @questions = Question.where("question_type = ?", params[:question_type])
    elsif params[:category] != nil
      @questions = Question.where("category = ?", params[:category])
    else
      @questions = Question.all
    end
    json_response(@questions)
  end

  # POST /questions
  def create
    @question = Question.create!(question_params)
    json_response(@question, :created)
  end

  # GET /questions/:id
  def show
    json_response(@question)
  end

  # PUT /questions/:id
  def update
    @question.update(question_params)
    head :no_content
  end

  # DELETE /questions/:id
  def destroy
    @question.destroy
    head :no_content
  end

  private

  def question_params
    # whitelist params
    params.permit( :category, :age_range, :gender, :question_type, :options, :question_text, :coach_id, :player_id , :pattern_multi)
  end

  def set_question
    @question = Question.find(params[:id])
  end
end
