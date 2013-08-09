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

  describe '#facebook_link' do
    context 'when a user enters something in to the :facebook field' do
      it "should check to see whether the user entered a url or just a page name"
      it "should append http:// if it is a url and it doesn't have it already"
      it "should turn the page name in to a link"
    end
  end

  describe '#twitter_link' do
    context 'when a user enters something in to the :twitter field' do
      it "should turn the twitter handle in to a twitter link"
    end
  end

  describe '#instagram_link' do
    context 'when a user enters something in to the :instagram field' do
      it "should check to see whether the user entered a url or just a username"
      it "should append http:// to urls that don't have http"
      it "should create a link from the username"
    end
  end
  
  describe '#flickr_link' do
    context 'when a user enters something in to the :flickr field' do
      it "should check to see whether the user entered a url or just a flickr username"
      it "should append http:// to urls that don't have http://"
      it "should create a full link from the username"
    end
  end
end
