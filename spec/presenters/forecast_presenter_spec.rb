require 'rails_helper'

RSpec.describe ForecastPresenter do
  let(:day1) { {conditions: 'rainy', date: 1.day.from_now, low: '42', high: '72'} }
  let(:day2) { {conditions: 'sunny', date: 2.days.from_now, low: '41', high: '71'} }
  let(:forecast_day1_response) do
    double(
      conditions: day1[:conditions],
      date: double(epoch: day1[:date]),
      low: double(fahrenheit: day1[:low]),
      high: double(fahrenheit: day1[:high]),
    )
  end
  let(:forecast_day2_response) do
    double(
      conditions: day2[:conditions],
      date: double(epoch: day2[:date]),
      low: double(fahrenheit: day2[:low]),
      high: double(fahrenheit: day2[:high]),
    )
  end

  let(:forecast_response) do
    double(
      simpleforecast: double(
        forecastday: [
          forecast_day1_response,
          forecast_day2_response,
        ]
      )
    )
  end
  subject { ForecastPresenter.new(forecast_response) }

  describe "#simple" do

    it "returns the correctly sized array" do
      expect(subject.simple.length).to eq(2)
    end
    it "returns the correct daily forecasts" do
      expect(subject.simple.first).to eq(
        Hashie::Mash.new(
          conditions: day1[:conditions],
          date: day1[:date].localtime.to_date,
          high: day1[:high],
          low: day1[:low],
        )
      )
    end
  end
end
