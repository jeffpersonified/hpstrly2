require 'spec_helper'

describe Url do
  describe "database" do
    context "columns" do
      it { should have_db_column(:original_url).of_type(:text) }
      it { should have_db_column(:short_url).of_type(:string) }
      it { should have_db_column(:page_views).of_type(:integer) }
      it { should have_db_column(:user_id).of_type(:integer) }
    end
    context "indices" do
      it { should have_db_index(:short_url) }
    end
  end
  describe "associations" do
    pending "need users first"
  end
end
