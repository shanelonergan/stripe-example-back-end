require 'stripe'
require 'dotenv'

class ChargesController < ApplicationController

    def create
        Stripe.api_key = ENV['STRIPE_SECRET_KEY']

        Stripe::Charge.create({
            amount: 2000,
            currency: 'usd',
            source: 'tok_visa',
            description: 'My First Test Charge (created for API docs)',
        })
    end

end
