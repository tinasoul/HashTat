require 'spec_helper'

describe Artist do
  describe 'validations' do
    context 'when a first name is not entered' do
      it 'should not save the artist' do
          Artist.new(:first_name => '').should_not be_valid
      end
    end
  end

  describe '#full_name' do
  let(:artist){ Artist.new }
    context 'when a first name and last name are entered' do
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

  describe '#add_http' do
  let(:artist){ Artist.new(:first_name => 'Shannon') }
    context 'when the method is sent a url' do
      it "append http:// if it doesnt have it already" do
        expect(artist.add_http('www.facebook.com')).to eq('http://www.facebook.com')
      end
    end
  end

end
