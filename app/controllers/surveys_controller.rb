class SurveysController < ApplicationController
  before_action :authenticate_user!

  def index
    @surveys = @user.surveys.all
  end

  def show
    @survey = Survey.find(params[:id])
  end

  def edit
    @survey = Survey.find(params[:id])
  end

  def update
    @user = current_user
    @survey = @user.surveys.find(params[:id])
    if @survey.update(survey_params)
      redirect_to @survey, notice: "Edit successful"
    else
      render :edit
    end
  end

  def new
    @survey = Survey.new
  end

  def create
    @user = current_user
    @survey = @user.surveys.new(survey_params)
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
    params.require(:survey).permit(:title)
  end

end
