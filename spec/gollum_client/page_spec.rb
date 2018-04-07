require 'spec_helper'

describe GollumClient::Page, :vcr do
  context "fetching content" do

    let(:page) { GollumClient::Page.fetch('/test') }
    it 'contains testing 1 2 3' do
      expect(page.body).to include('testing')
    end

    it 'does not contain navigation' do
      expect(page.body).to_not include('Last edited')
    end

    it 'returns nil if the page is not found' do
      expect(GollumClient::Page.fetch('/will-never-be-present')).to be_nil
    end

    it 'returns a title for metadata' do
      expect(page.meta[:title]).to_not be_nil
    end
  end
end
