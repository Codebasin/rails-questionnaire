# require 'rails_helper'
#
# describe 'editing a survey' do
#
#   before(:each) do
#     survey = Survey.create(survey_attributes)
#     visit survey_path(survey)
#     click_link "Edit"
#   end
#
#   it 'successfully updates a surveys attributes' do
#     expect(current_path).to eq(edit_survey_path(Survey.last))
#     expect(find_field('title').value).to eq(Survey.last.title)
#     fill_in 'title', with: 'Updated Title for Survey'
#     click_button 'Update Survey'
#     expect(current_path).to eq(survey_path(Survey.last))
#     expect(page).to have_content("Edit successful")
#   end
#
#   it "if successful, will show a notice" do
#     expect(current_path).to eq(surveys_path)
#     expect(page).to have_content("successfully deleted")
#   end
#
# end
