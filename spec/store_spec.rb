require('spec_helper')

describe(Store) do
  it { should have_and_belong_to_many(:brands) }

  it("returns the name of a store") do
    test_store = Store.new({:store_name => 'Old Navy', :location => 'Portland', :id => nil})
    expect(test_store.store_name).to(eq('Old Navy'))
  end
end
