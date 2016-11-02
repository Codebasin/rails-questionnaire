class QuestionsController < ApplicationController
    before_action :authenticate_user!

    # before_action :set_user, only: [:show, :edit, :update, :destroy]
    #
    # before_action :set_question, only: [:show, :edit, :update, :destroy]
    # before_action :set_survey


    # def update
    #   @survey = Survey.find(params[:survey_id])
    #   @question = @survey.questions.find(params[:id])
    #   if @survey.update(survey_params)
    #     redirect_to @survey, notice: "Edit successful"
    #   else
    #     render :edit
    #   end
    # end

    def new
      @survey = Survey.find(params[:survey_id])
      @question = @survey.questions.build
    end

    def create
      @survey = Survey.find(params[:survey_id])
      @question = Question.new(question_params)

      if @survey.save
        redirect_to @survey, notice: "Successfully created"
      else
        render :new
      end
    end

    # def destroy
    #   @survey = Survey.find(params[:id]).destroy
    #   redirect_to surveys_path, danger: "successfully deleted"
    # end
    #
    private

    def question_params
      params.require(:question).permit(:title, :survey_id, :user_id)
    end
    #
    # def set_survey
    #   @survey = Survey.find(params[:survey_id])
    # end

end
