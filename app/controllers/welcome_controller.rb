#ToDo Need specs
class WelcomeController < ApplicationController
  def index
    @currencies = ['USD','JPY', 'BGN', 'CZK', 'DKK', 'GBP']
    date    = params[:date]
    base    = params[:from]
    counter = params[:to]
    amount  = params[:amount]
    if !(date.blank? || base.blank? || counter.blank? || amount.blank?)
      date    = date.to_datetime
      amount  = amount.to_i
      @result = ExchangeRate.calculate_rate(date, amount, base, counter)
      @to_curr = counter
    end

    respond_to do |format|
      format.html {}
      format.js { render layout: false}
    end
  end

end
