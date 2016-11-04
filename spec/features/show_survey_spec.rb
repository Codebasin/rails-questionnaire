require 'rails_helper'

describe "viewing a survey show page" do

  before(:each) do
    survey = Survey.create({title: "Test", questions_attributes: [{title: "question"}]})
    visit survey_path(survey)
  end


   it "contains a surveys correct title" do
     expect(page).to have_text("Test")
   end

   it "contains the titles of a questions" do
     expect(page).to have_text("question")
  end

  it "contains an Answers Field for each question" do
    expect(page).to have_css('#answer')
  end

end


describe "viewing a survey show page" do

  it "contains the titles of multiple questions" do
    survey = Survey.create({title: "Test", questions_attributes: [{title: "question"}, {title: "question2"}]})
    visit survey_path(survey)
    expect(page).to have_text("question")
    expect(page).to have_text("question2")
  end

end
