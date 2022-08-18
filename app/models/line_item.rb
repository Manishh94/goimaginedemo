class LineItem < ActiveRecord::Base
  belongs_to :product, optional: true
  belongs_to :cart, optional: true
  belongs_to :order, optional: true

  # LOGIC
  def total_price
    self.quantity * self.product.price
  end
end
