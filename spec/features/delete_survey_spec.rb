require 'rails_helper'

describe 'deleting a survey' do

  before(:each) do
    @survey = {title: "Test", questions_attributes: {question: "question 1"}}
    Survey.create(@survey)
    visit survey_path(@survey)
    click_link "Delete"
  end

  it 'successfully removes a survey after clicking delete' do
    expect(current_path).to eq(surveys_path)
    expect(page).to_not have_content("Test")
  end

  it "if successful, will show a notice" do
    expect(current_path).to eq(surveys_path)
    expect(page).to have_content("successfully deleted")
  end

end
