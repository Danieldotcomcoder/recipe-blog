class RecipeFood < ApplicationRecord
  belongs_to :recipe
  belongs_to :food

  def cal_value(quantity, price)
    quantity * price
  end
end
