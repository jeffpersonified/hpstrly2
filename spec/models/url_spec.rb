require 'spec_helper'

describe Url do

  describe "database" do
    context "columns" do
      it { should have_db_column(:original_url).of_type(:text) }
      it { should have_db_column(:short_url).of_type(:string) }
      it { should have_db_column(:page_views).of_type(:integer) }
      it { should have_db_column(:user_id).of_type(:integer) }
      it { should have_db_column(:created_at).of_type(:datetime) }
      it { should have_db_column(:updated_at).of_type(:datetime) }
    end
    context "indices" do
      it { should have_db_index(:short_url) }
    end
  end

  describe "associations" do
    it { should belong_to(:user) }
  end

  describe "validations" do
    it { should validate_numericality_of(:page_views) }
    it { should validate_presence_of(:original_url).
          with_message(/Enter a url/) }
    it { should validate_presence_of(:original_url).
          with_message(/Enter a url/) }
    it { should validate_uniqueness_of(:short_url).
          with_message(/Choose a unique url/) }
    it { should allow_value('https://www.google.com/').for(:original_url) }
    it { should allow_value('http://www.google.com/').for(:original_url) }
    it { should allow_value('www.google.com').for(:original_url) }
    it { should allow_value('google.com').for(:original_url) }
    it { should_not allow_value('googlecom').for(:original_url) }
  end

  describe "#generate_short_url" do
    it "should return a hipster phrase" do
      url = FactoryGirl.build(:url)
      url.stub(:hipster_terms).and_return(['obscure', 'obscure', 'obscure'])
      url.generate_short_url.should eq('obscure_obscure_obscure')
    end

    context "before create" do
      it "should be called" do
        url = FactoryGirl.build(:url)
        url.should_receive(:generate_short_url)
        url.save
      end
    end
  end

  describe "#format_original_url" do
    pending "format naked and non-http/https urls for routing"
  end
end
