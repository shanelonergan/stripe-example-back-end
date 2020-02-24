require 'stripe'
require 'dotenv'
Dotenv.load

class ChargesController < ApplicationController

    def create

        begin
            Stripe.api_key = ENV['STRIPE_SECRET_KEY']
            token = params[:charge][:token]
            price = params[:price]

            charge = Stripe::Charge.create({
                amount: price,
                currency: 'usd',
                source: token,
                description: 'My First Test Charge (created for API docs)',
            })

            render json: charge
        end
    end

end
