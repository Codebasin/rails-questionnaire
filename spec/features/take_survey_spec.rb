require 'rails_helper'

describe 'taking a new survey' do

  before(:each) do
      survey = Survey.create(survey_attributes)
      visit survey_path(survey)
      it { should accept_nested_attributes_for(:question) }
      fill_in :answer, with: "new title"
      click_button 'Submit Survey'
      expect {click_button "Create Project"}.to change(Survey, :count)


    end

  it 'successfully submits survey after button click' do
    it { should accept_nested_attributes_for(:question) }

    fill_in :answer, with: "new title"
    fill_in :Artists, with: "new artists"
    select "lowercase", :from => "project_genres"
    fill_in :Host, with: "new hosts"
    fill_in :Address, with: "new address"
    fill_in :Neighborhood, with: "new neighborhood"
    fill_in :Goal, with: 100
    select (Time.now.year + 1).to_s, :from => "project_finish_1i"
    fill_in :Image, with: "event-default.jpg"

    click_button 'Create Project'
    expect(page).to have_content("new title")
    expect(page).to have_content("100")
    expect(page).to have_css('[src]')
  end

  it 'does not save a project if its invalid' do
    expect {click_button "Create Project"}.to_not change(Project, :count)
    expect(page).to have_text("error")
  end


  it "successfully, will show a flash notice" do
    fill_in :Title, with: "new title"
    fill_in :Artists, with: "new artists"
    select "lowercase", :from => "project_genres"
    fill_in :Host, with: "new hosts"
    fill_in :Address, with: "new address"
    fill_in :Neighborhood, with: "new neighborhood"
    fill_in :Goal, with: 100
    select (Time.now.year + 1).to_s, :from => "project_finish_1i"
    fill_in :Image, with: "event-default.jpg"

    click_button "Create Project"
    expect(current_path).to eq(project_path(Project.last))
    expect(page).to have_content("You created a project!")
  end


end
