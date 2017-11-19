require 'rails_helper'

describe Imports::Creator, type: :service do
  let(:eraser) {
    instance_double Imports::Eraser, call: true
  }

  before do
    Registry::Container.stub("import.eraser", eraser)
  end

  after { Registry::Container.unstub }

  describe '#call' do
    let(:user) { create :user }

    let(:result) { subject.call(user) }

    it "should clear out the existing imports first" do
      expect(eraser)
        .to receive(:call)
        .with(user)
      result
    end

    it "should create a new import" do
      result
      expect(user.imports.reload.count).to eq 1
    end

    it "should create the import with the default name" do
      expect(result.name)
        .to eq Imports::Creator::DEFAULT_NAME
    end

    context "When called without a block" do
      it "should return the new Import" do
        expect(result).to be_a Import
      end
    end

    context "When a block is given" do
      it "should yield correctly" do
        expect { |b| subject.call(user, &b) }
          .to yield_with_args
      end
    end
  end
end