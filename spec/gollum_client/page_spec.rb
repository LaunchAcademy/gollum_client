require 'spec_helper'

describe GollumClient::Page, :vcr do
  context "fetching content" do

    it 'contains testing 1 2 3' do
      expect(GollumClient::Page.fetch('/test').body).to include('testing')
    end

    it 'does not contain navigation' do
      expect(GollumClient::Page.fetch('/test').body).to_not include('Last edited')
    end

    it 'returns nil if the page is not found' do
      expect(GollumClient::Page.fetch('/will-never-be-present')).to be_nil
    end
  end
end
