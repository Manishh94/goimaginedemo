class CheckoutController  < ApplicationController

  def create
    @session = Stripe::Checkout::Session.create({
      payment_method_types: ['card'],
      line_items: [{
          name: "First Item",
          amount: 2000,
          currency: "usd",
          quantity: 1
      },
      {
        name: "Second Item",
        amount: 3000,
        currency: "usd",
        quantity: 1
      }
    ],
      shipping_options: [
        {
          shipping_rate_data: {
            type: 'fixed_amount',
            fixed_amount: {
              amount: 0,
              currency: 'usd',
            },
            display_name: 'Free shipping',
            # Delivers between 5-7 business days
            delivery_estimate: {
              minimum: {
                unit: 'business_day',
                value: 5,
              },
              maximum: {
                unit: 'business_day',
                value: 7,
              },
            }
          }
        },
        {
          shipping_rate_data: {
            type: 'fixed_amount',
            fixed_amount: {
              amount: 1500,
              currency: 'usd',
            },
            display_name: 'Next day air',
            # Delivers in exactly 1 business day
            delivery_estimate: {
              minimum: {
                unit: 'business_day',
                value: 1,
              },
              maximum: {
                unit: 'business_day',
                value: 1,
              },
            }
          }
        },
      ],
      mode: 'payment',
      metadata: {order_id: 1},
      customer_email: "manish@yopmail.com",
      success_url: root_url,
      cancel_url: root_url
    })

    respond_to do |format|
      format.js
    end
  end
end