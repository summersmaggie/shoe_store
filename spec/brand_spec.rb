require('spec_helper')

describe(Brand) do
  it { should have_and_belong_to_many(:stores) }

  it("returns the name of a brand") do
    test_brand = Brand.new({:brand_name => 'Keen', :price => '50', :id => nil})
    expect(test_brand.brand_name).to eq 'Keen'
  end

  # it("returns all brands") do
  #   brand1 = Brand.create({:brand_name => 'Keen', :price => '50', :id => nil})
  #   brand2 = Brand.create({:brand_name => 'Nordstrom', :price => '50', :id => nil})
  #   expect(Brand.all()).to eq [brand1, brand2]
  # end
end
