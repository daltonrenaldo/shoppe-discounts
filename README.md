# Shoppe::Discounts

Shoppe-discounts is a simple shoppe plugin that adds basic discount code functionality to your shoppe e-commerce application.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'shoppe-discounts'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install shoppe-discounts

## Usage

Add this to your Gemfile (with `github: "daltonrenaldo/shoppe-discounts"` as source, since not on rubygems yet).

On your checkout form, simply add a coupon/discount field. On the server side, capture the params[:discount_code], if it's valid, add the discount to the current_order.

```ruby
discount = Shoppe::Discount.find_by_code(params[:discount_code])
if discount
  @order.discount = discount
  @order.save
end
```

and everything else should work the same. The discount is not applied, and will be reflected on the price.

## Next
* Specs
* Discounts valid only for specific products

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/daltonrenaldo/shoppe-discount. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.
