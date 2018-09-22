require 'rails_helper'
require 'rake'

RSpec.describe 'Rake::Task[import:programs]' do
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

    expect(Program.find(5)).to have_attributes(code: 'some code')
  end

  it 'deletes the previous data' do
    Program.create!

    csv = <<~CSV
      code
      some code
    CSV

    import(csv)

    expect(Program.count).to eq(1)
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
