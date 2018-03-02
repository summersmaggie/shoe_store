class Brand < ActiveRecord::Base
  has_and_belongs_to_many(:stores)
  before_save(:titlecase_brand_name)
  validates(:price, :presence => true)
  validates(:brand_name, {:presence => true, :length => { :maximum => 100 }})

  private

  def titlecase_brand_name
    self.brand_name=(brand_name().titlecase())
  end
end
