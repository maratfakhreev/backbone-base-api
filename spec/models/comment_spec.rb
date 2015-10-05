require "spec_helper"

describe Comment do
  describe "validations" do
    it { should validate_presence_of(:user) }
    it { should validate_presence_of(:article) }
  end

  describe "associations" do
    it { should belong_to(:article) }
    it { should belong_to(:user) }
  end
end
