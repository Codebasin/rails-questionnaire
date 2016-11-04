require 'rails_helper'

describe "A Survey" do

   let(:survey) { @survey = {title: "Test", questions_attributes: [{title: "question"}]} }

   it "is successfully created" do
     expect { Survey.create(@survey) }.to change {Survey.count}.by(1)
   end

end
