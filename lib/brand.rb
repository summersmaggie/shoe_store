class Brand < ActiveRecord::Base
  has_and_belongs_to_many(:stores)
  before_save(:titlecase_brand_name)
  # before_save(:currency_format_price)
  validates(:price, :presence => true)
  validates(:brand_name, {:uniqueness => true, :presence => true, :length => { :maximum => 100 }})

  def titlecase_brand_name
    self.brand_name=(brand_name().titlecase())
  end

  # def currency_format_price(number)
  #   self.price=(price().to_i().number_to_currency(number))
  # end
end
