class Store < ActiveRecord::Base
  has_and_belongs_to_many(:brands)
  before_save(:titlecase_store_name)
  validates(:store_name, :presence => true)
  validates(:location, :presence => true)

  private

  def titlecase_store_name
    self.store_name=(store_name().titlecase())
  end
end
