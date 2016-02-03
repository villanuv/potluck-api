require_relative '../user'

RSpec.describe User do

  describe "#initialize" do
    it "assigns nil to @email" do
      user = User.new
      expect(user.email).to eq nil
    end

    it "assigns nil to @api" do
      user = User.new
      expect(user.api).to eq nil
    end

    it "assigns empty array to @items" do
      user = User.new
      expect(user.items).to be_empty
    end
  end

end