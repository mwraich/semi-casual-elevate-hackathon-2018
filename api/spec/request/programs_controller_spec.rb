require 'rails_helper'

RSpec.describe ProgramsController, type: :request do
  it 'returns all events' do
    Program.create!(title: 'some event')

    get '/events'

    expect(records.map(&:title)).to include('some event')
  end

  context 'searching' do
    it 'filters events by title' do
      Program.create!(title: 'find me')
      Program.create!(title: 'something else')

      get '/events?q=find+me'

      expect(records.map(&:title)).to include('find me')
      expect(records.map(&:title)).to_not include('something else')
    end

    it 'filters events by description' do
      Program.create!(description: 'find me')
      Program.create!(description: 'something else')

      get '/events?q=find+me'

      expect(records.map(&:description)).to include('find me')
      expect(records.map(&:description)).to_not include('something else')
    end

    it 'filters by location' do
      Program.create!(branch_name: 'find me')
      Program.create!(branch_name: 'something else')

      get '/events?location=find+me'

      expect(records.map(&:branch_name)).to include('find me')
      expect(records.map(&:branch_name)).to_not include('something else')
    end
  end

  private

  def records
    JSON
      .parse(response.body)
      .map { |record| OpenStruct.new(record) }
  end
end
