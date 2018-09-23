require 'rails_helper'
require 'rake'

RSpec.describe 'Rake::Task[import:programs]' do
  before do
    Rails.application.load_tasks
  end

  context 'programs' do
    it 'imports from json' do
      program = sample_program_hash.merge(title: 'some title')
      json_file = write_to_file([program].to_json)

      expect do
        import(json_file)
      end.to change { Program.count }.by(1)

      expect(Program.last).to have_attributes(
        title: 'some title'
      )
    end

    it 'deletes the previous data' do
      Program.create!

      program = sample_program_hash.merge(title: 'some title')
      json_file = write_to_file([program].to_json)

      import(json_file)

      expect(Program.count).to eq(1)
    end
  end

  private

  def import(file_path)
    task_name = 'import:programs'
    Rake::Task[task_name].invoke(file_path)
  end

  def write_to_file(contents)
    file = Tempfile.new
    file.write(contents)
    file.flush
    file.path
  end
end
