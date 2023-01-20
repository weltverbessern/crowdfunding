require 'active_merchant'

class CrowdfundingController < ApplicationController
  def index
  end

  def checkout!
    permitted = params.permit(
      :email,
      :incentive,
      :first_name,
      :last_name,
      :address_line1,
      :address_line2,
      :address_zip,
      :city,
      :state,
      :phone,
      :country,
      :payment_method,
    )
    show_error = Proc.new do |message|
      flash[:danger] = message
      flash[:params] = permitted.to_h
      redirect_to :action => :checkout
      return
    end

    @user = User.find_or_create_by(:email => permitted[:email])

    if Incentive.exists?
      incentive_id = permitted[:incentive]
      show_error.call t('crowdfunding.checkout.error.incentive_missing') if incentive_id.nil?
      incentive = Incentive.find(incentive_id)
      price = incentive.amount
    else
      price = Settings.price
    end

    if Settings.payment_provider_stripe && permitted[:payment_method] == 'stripe'
      purchase_options = {
        currency: Settings.currency,
        automatic_payment_methods: {
          enabled: true,
        },
      }
      intent = GATEWAY_STRIPE.create_intent((price * 100).round, nil, purchase_options)
      payment_ref = intent.params['id']
    else
      show_error.call t('crowdfunding.checkout.error.payment_method_missing')
    end

    @order = Order.generate
    @order.product_name = t('project.name')
    @order.payment_mode = Settings.payment_mode
    @order.payment_provider = permitted[:payment_method]
    @order.payment_ref = payment_ref
    @order.payment_status = 'pending'
    @order.incentive_id = permitted[:incentive]
    @order.price = price
    @order.user_id = @user.id
    @order.first_name = permitted[:first_name]
    @order.last_name = permitted[:last_name]
    @order.address_line1 = permitted[:address_line1]
    @order.address_line2 = permitted[:address_line2]
    @order.city = permitted[:city]
    @order.state = permitted[:state]
    @order.phone = permitted[:phone]
    @order.zip = permitted[:address_zip]
    @order.country = permitted[:country]
    @order.save!

    redirect_to :action => :pay, :uuid => @order.uuid
  end

  def pay
    @order = Order.find_by(:uuid => params[:uuid])

    if @order.payment_provider == 'stripe'
      intent = GATEWAY_STRIPE.show_intent(@order.payment_ref, {})
      @client_secret = intent.params['client_secret']

      if intent.params['status'] == 'processing'
        @order.payment_status = 'processing'
        @order.save!
        redirect_to :action => :share, :uuid => @order.uuid
      end

      if intent.params['status'] == 'succeeded'
        @order.payment_status = 'completed'
        @order.save!
        redirect_to :action => :share, :uuid => @order.uuid
      end
    end
  end

  def share
    @order = Order.find_by(:uuid => params[:uuid])
  end
end
