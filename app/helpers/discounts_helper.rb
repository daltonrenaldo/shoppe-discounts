# TODO: move this to shoppe-discounts gem
module DiscountsHelper
  def pretty_discount(discount)
    if discount.fixed?
      number_to_currency(discount.value)
    else
      "#{discount.value.to_i}%"
    end
  end
end
