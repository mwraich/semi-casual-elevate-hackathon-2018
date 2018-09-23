require 'rails_helper'

RSpec.describe DataImporter do
  context 'importing events' do
    it 'from JSON' do
      program = sample_program_hash(
        title: 'some title',
        age_groups: 'Adult, Older Adult, Teen',
        age_group_1: 'Adult',
        age_group_2: 'Older Adult',
        age_group_3: 'Teen',
        primary_event_type: '01-Library Settlement Partnerships',
        branch_name: 'Agincourt',
      )
      file_path = write_programs_to_file(program)

      expect do
        DataImporter.programs(file_path)
      end.to change { Program.count }.by(1)

      expect(Program.last).to have_attributes(
        title: 'some title',
        age_groups: 'Adult, Older Adult, Teen',
        primary_event_type: '01-Library Settlement Partnerships',
        branch_name: 'Agincourt',
        master_category: 'culture'
      )
    end

    it 'imports multiple programs from JSON' do
      file_path = write_programs_to_file(
        sample_program_hash(title: 'title 1'),
        sample_program_hash(title: 'title 2')
      )

      expect do
        DataImporter.programs(file_path)
      end.to change { Program.count }.by(2)
    end
  end

  private

  def write_programs_to_file(*programs)
    write_to_file(programs.to_json)
  end

  def write_to_file(content)
    file = Tempfile.new
    file.write(content)
    file.flush
    file.path
  end
end
