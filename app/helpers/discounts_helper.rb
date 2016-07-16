module DiscountsHelper
  def pretty_discount(discount)
    if discount.unit == "cash"
      number_to_currency(discount.value)
    else
      "#{discount.value} %"
    end
  end
end
