require 'rails_helper'

describe 'taking a new survey' do

  before(:each) do
    @survey = {title: "Test", questions_attributes: {question: "question 1"}}
    Survey.create(@survey)
    visit surveys_path
    click_link 'take survey'
    expect(current_path).to eq(survey_path(Survey.last))
  end

  it 'successfully submits survey with answers after button click' do
    fill_in :answer, with: "new answer"
    click_button 'Submit Survey'
    expect {click_button "Submit Survey"}.to change(Answer, :count)
  end
end
333
