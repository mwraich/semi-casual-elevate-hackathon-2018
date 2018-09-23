require "json"

module DataImporter
  extend self

  LOOKUP = {
    'title' => 'title',
    'agegroups' => 'age_groups',
    'agegroup1' => 'age_group_1',
    'agegroup2' => 'age_group_2',
    'agegroup3' => 'age_group_3',
    'prieventtype' => 'primary_event_type'
  }.freeze

  def self.programs(json_file)
    read_and_parse(json_file).each do |values|
      whitelisted_json = values
        .transform_keys { |key, _value| LOOKUP[key] }
        .slice(*whitelisted_attributes)

      Program.create!(whitelisted_json)
    end

  end

  private

  def self.read_and_parse(json_file)
    file_contents = File.read(json_file)
    JSON.parse(file_contents)
  end

  def self.whitelisted_attributes
    LOOKUP.values
  end
end