require 'rails_helper'

describe Imports::Eraser, type: :service do
  describe '#call' do
    let(:user) { create :user, :with_imports }

    before do
      subject.call(user)
    end

    it "should delete all the imports" do
      expect(user.imports).to be_empty
    end
  end
end