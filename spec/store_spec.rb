require('spec_helper')

describe(Store) do
  it { should have_and_belong_to_many(:brands) }

  it("returns the name of a store") do
    test_store = Store.new({:store_name => 'Old Navy', :location => 'Portland', :id => nil})
    expect(test_store.store_name).to eq 'Old Navy'
  end

  it("converts the store name to uppercase") do
    store = Store.create({:store_name => 'old navy', :location => 'Portland', :id => nil})
    expect(store.store_name()).to eq 'Old Navy'
  end

  it("converts location to uppercase") do
    store = Store.create({:store_name => 'old navy', :location => 'portland', :id => nil})
    expect(store.location()).to eq 'Portland'
  end

  it("validates the presence of name and location") do
    store = Store.new({:store_name =>  "", :location => ""})
    expect(store.save()).to eq false
  end

  it("ensures the length of the store name is at most 100 characters") do
    store = Store.new({:store_name => "s".*(101)})
    expect(store.save()).to eq false
  end
end
