require_relative '../item'

RSpec.describe Item do

  describe "#initialize" do
    it "assigns nil to @email" do
      item = Item.new('foo')
      expect(item.name).to eq 'foo'
    end
  end

end