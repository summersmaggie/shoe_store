class CreateBrands < ActiveRecord::Migration[5.1]
  def change
    create_table(:brands) do |t|
      t.column(:brand_name, :string)
      t.column(:price, :int)
    end
  end
end
