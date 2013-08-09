require 'spec_helper'

describe Artist do
  describe 'validations' do
    context 'when a first name is not entered'
      it 'should not save the artist'
          Artist.new(:first_name => '').should_not be_valid
        end
    end

  describe '#full_name' do
  let(:artist){ Artist.new }
    context 'when a frist name and last name are entered' do
        it "should set the artist's full name equal to their first and last name combined" do
          artist.first_name = "Matt"
          artist.last_name = "Buck"
          expect(artist.full_name).to eq("Matt Buck")
        end
    end

    context 'when only a first name is entered' do
        it "should set the artist's full name to just their first name" do
          artist.first_name = "Matt"
          expect(artist.full_name).to eq("Matt")
        end
    end
    
  end
end