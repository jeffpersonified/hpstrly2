require 'spec_helper'

describe User do
  describe "associations" do
    it { should have_many(:urls).dependent(:destroy) }
  end
end
