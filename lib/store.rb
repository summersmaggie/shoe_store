class Store < ActiveRecord::Base
  has_and_belongs_to_many(:brands)
  before_save(:titlecase_store_name)
  before_save(:titlecase_location)
  validates(:store_name, {:uniqueness => true, :presence => true, :length => { :maximum => 100 }})
  validates(:location, {:uniqueness => true, :presence => true})

  def titlecase_store_name
    self.store_name=(store_name().titlecase())
  end

  def titlecase_location
    self.location=(location().titlecase())
  end
end
