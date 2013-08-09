require 'spec_helper'

# Specs in this file have access to a helper object that includes
# the ArtistHelper. For example:
#
# describe ArtistHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
describe ArtistHelper do
  describe 'add_http' do
    context 'when the method is sent a url' do
      it "append http:// if it doesnt have it already" do
        expect(add_http('www.facebook.com')).to eq('http://www.facebook.com')
      end
    end
  end

  describe 'build_link' do
    let(:artist) do 
      mock_model Artist, :twitter => 's_byrne',
                          :facebook => 'www.facebook.com/shannonleighbyrne'
    end
    context 'if a user has added a username for a social network' do
      it 'should turn that data into a functional link' do
        expect(build_link(artist,:twitter)).to eq('http://www.twitter.com/s_byrne')
      end
    end
    context 'if a user has added a url for the social network' do
      it 'should turn that data into a functional link' do
        expect(build_link(artist,:facebook)).to eq('http://www.facebook.com/shannonleighbyrne')
      end
    end
  end
end
