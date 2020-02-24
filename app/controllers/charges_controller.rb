require 'stripe'
require 'dotenv'
Dotenv.load

class ChargesController < ApplicationController

    def create
        Stripe.api_key = ENV['STRIPE_SECRET_KEY']
        token = params[:charge][:token]
        price = params[:price]

        Stripe::Charge.create({
            amount: 2000,
            currency: 'usd',
            source: token,
            description: 'My First Test Charge (created for API docs)',
        })
    end

end
