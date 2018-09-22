require 'rails_helper'

RSpec.describe DataImporter do
  it 'imports a blank record' do
    csv = <<~CSV
      id,code
      5,some code
    CSV

    expect do
      import(csv)
    end.to change { Program.count }.by(1)

    expect(Program.find(5)).to have_attributes(code: 'some code')
  end

  private

  def import(csv)
    file = Tempfile.new
    file.write(csv)
    file.flush

    DataImporter.programs(file.path)
  end
end
