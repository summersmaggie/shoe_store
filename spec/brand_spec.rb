require('spec_helper')

describe(Brand) do
  it { should have_and_belong_to_many(:stores) }

  it("returns the name of a brand") do
    test_brand = Brand.new({:brand_name => 'Keen', :price => '50', :id => nil})
    expect(test_brand.brand_name).to eq 'Keen'
  end

  it("converts the brand name to uppercase") do
    brand = Brand.create({:brand_name => 'keen', :price => '10'})
    expect(brand.titlecase_brand_name()).to eq 'Keen'
  end

  it("validates the presence of name and price") do
    brand = Brand.new({:brand_name => "", :price => ""})
    expect(brand.save()).to eq false
  end

  it("ensures the length of the brand name is at most 100 characters") do
    brand = Brand.new({:brand_name => "b".*(101)})
    expect(brand.save()).to eq false
  end

  it("validates there are no duplicates") do
    brand1 = Brand.new({:brand_name => 'keen', :price => '10'})
    brand2 = Brand.new({:brand_name => 'keen', :price => '10'})
    expect(brand1.save()).to eq false
  end

  it("ensures there is no whitespace in name") do
    brand1 = Brand.new({:brand_name => 'Keen '})
    expect(brand1.save()).to eq false
  end
end
