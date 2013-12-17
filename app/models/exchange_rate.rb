class ExchangeRate
  def self.calculate_rate(date, amount, base_curr, counter_curr)
     rate = FxLib::ExchangeRate.at(date, base_curr, counter_curr)
     return (rate * amount).round(4)
  end
end
