class SurveysController < ApplicationController
  before_action :authenticate_user!

  def index
    @surveys = Survey.all
  end

  def show
    @survey = Survey.find(params[:id])
  end

  def edit
  end

  def update
    @survey = @user.surveys.find(params[:id])
    if @survey.update(survey_params)
      redirect_to @survey, notice: "Edit successful"
    else
      render :edit
    end
  end

  def new
    @survey = Survey.new
    @survey.questions.build
  end

  def create
    @survey = Survey.new(survey_params)
    if @survey.save
      redirect_to @survey, notice: "Successfully created"
    else
      render :new
    end
  end

  def destroy
    @survey = Survey.find(params[:id]).destroy
    redirect_to surveys_path, danger: "successfully deleted"
  end

  private

  def survey_params
    params.require(:survey).permit(:title, :user_id)
  end

end
