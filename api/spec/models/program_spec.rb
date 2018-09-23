# require 'rails_helper'

RSpec.describe Program do
  context 'tags' do
    it 'can have tags added to it' do
      program = Program.create
      program.tag_list.add('Family')
      program.save!

      expect(program.tags.count).to eq(1)
      expect(program.tags.first.name).to eq('Family')
    end
  end
end