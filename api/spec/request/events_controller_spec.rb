require 'rails_helper'

RSpec.describe EventsController, type: :request do
  it 'renders programs' do
    Program.create!(title: 'some event')

    get '/events'

    expect(records.map(&:title)).to include('some event')
  end

  private

  def records
    JSON
      .parse(response.body)
      .map { |record| OpenStruct.new(record) }
  end
end
