require 'rails_helper'

describe Tracks::Upserter, type: :service do
  let(:artist) {
    create :artist, name: "Cher"
  }

  let(:artist_upserter) {
    instance_double Artists::Upserter, call: artist
  }

  before do
    Registry::Container.stub("artist.upserter", artist_upserter)
  end

  after do
    Registry::Container.unstub
  end

  describe '#call' do
    let(:result) {
      subject.call(track.title, artist.name)
    }

    context "When the track already exists" do
      let!(:track) { create :track, artist: artist, title: "Believe" }

      it "should return the existing track" do
        expect(result).to eq track
      end
    end

    context "When the track doesn't exist" do
      let(:result) {
        subject.call("Believe", "Cher")
      }

      it "should call the artist upserter" do
        expect(artist_upserter)
          .to receive(:call)
          .with("Cher")

        result
      end

      it "should return the newly created track" do
        expect(result.title).to eq "Believe"
        expect(result.artist.name).to eq "Cher"
        expect(result.persisted?).to be_truthy
        expect(result.created_at)
          .to be_within(0.1).of(DateTime.current)
      end

      context "When the track name is empty" do
        it "should raise a RecordInvalid error" do
          expect {
            subject.call(nil, "Cher")
          }.to raise_error(ActiveRecord::RecordInvalid)
        end
      end
    end
  end
end