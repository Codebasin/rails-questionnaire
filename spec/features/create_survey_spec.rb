require 'rails_helper'

describe "creating Survey with nested question attributes" do

   before(:each) do
     @survey = {title: "Test", questions_attributes: {question: "question 1"}}
   end

   it "should change the number of surveys by 1" do
      expect { Survey.create(@survey) }.to change(Survey, :count).by(1)
   end

   it "should change the number of Questions by 1" do
     expect { Survey.create(@survey) }.to change(Question, :count).by(1)
   end

end
