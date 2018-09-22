require 'rails_helper'
require 'rake'

RSpec.describe DataImporter do
  before do
    Rails.application.load_tasks
  end

  it 'imports a blank record' do
    csv = <<~CSV
      id,code
      5,some code
    CSV

    expect do
      import(csv)
    end.to change { Program.count }.by(1)

    expect(Program.find(5)).to have_attributes(
      code: 'some code'
    )
  end

  private

  def import(csv)
    file = Tempfile.new
    file.write(csv)
    file.flush

    task_name = 'import:programs'
    Rake::Task[task_name].invoke(file.path)
  end
end
