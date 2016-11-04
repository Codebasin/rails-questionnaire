require 'rails_helper'

describe 'taking a new survey' do

  it 'successfully submits survey with answer after button click' do
    survey = Survey.create({title: "Test", questions_attributes: [{title: "question"}]})
    visit surveys_path
    click_link 'take survey'
    expect(current_path).to eq(survey_path(survey))
    fill_in :answers_url[1], with: "new answer"  #answers_path
    click_button 'Submit Survey'
    expect {click_button "Submit Survey"}.to change(answer, :count)
  end
end
