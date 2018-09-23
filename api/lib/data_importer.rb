require "json"

module DataImporter
  extend self

  LOOKUP = {
    'title' => 'title',
    'description' => 'description',
    'agegroups' => 'age_groups',
    'agegroup1' => 'age_group_1',
    'agegroup2' => 'age_group_2',
    'agegroup3' => 'age_group_3',
    'prieventtype' => 'primary_event_type',
    'library' => 'branch_name'
  }.freeze

  CATEGORY_TYPE = {
      '00-Hobbies Crafts & Games' => 'arts',
      '00-Art Exhibits' => 'arts',
      '01-Museum & Arts Pass' => 'arts',
      '01-Frankenstein' => 'arts',

      '00-Culture Arts & Entertainment' => 'culture',
      '00-ESL & Newcomer Programs' => 'culture',
      '01-Library Settlement Partnerships' => 'culture',
      '00-History & Genealogy' => 'culture',
      '01-Culture Days' => 'culture',
      '01-Indigenous' => 'culture',
      '01-The eh List' => 'culture',
      '01-Civil Society' => 'culture',
      '01-Young Voices' => 'culture',
      '01-Digital Literacy Day' => 'culture',
      '01-March Break' => 'culture',
      '00-Library Visits & Tours' => 'culture',

      '00-Health & Wellness' => 'health',
      '01-Toronto Public Health: Your Health Matters' => 'health',
      '01-Ask an Expert' => 'health',

      '00-Reading Programs & Storytimes' => 'learning',
      '01-Ready for Reading Storytimes' => 'learning',
      '00-Book Clubs & Writers Groups' => 'learning',
      '00-After School' => 'learning',
      '00-Computer & Library Training' => 'learning',
      '00-Science & Technology' => 'learning',
      '01-Artists in the Library' => 'learning',
      '01-TPL Teens' => 'learning',
      '01-Digital Innovation' => 'learning',
      '00-Adult Literacy' => 'learning',
      '01-Innovator in Residence' => 'learning',
      '00-Author Talks & Lectures' => 'learning',
      '01-Maker Programs' => 'learning',
      '01-Law at the library' => 'learning',
      '01-Our Fragile Planet' => 'learning',
      '01-Pop-Up Learning Labs' => 'learning',
      '01-Writer in Residence' => 'learning',
      '01-Cutting Edge' => 'learning',
      '01-Thought Exchange' => 'learning',
      '01-Hour of Code' => 'learning',

      '00-Personal Finance' => 'life skills',
      '01-Youth Advisory Group' => 'life skills',
      '00-Small Business' => 'life skills',
      '00-Volunteering' => 'life skills',
      '01-Illustrator in Residence' => 'life skills',
      '00-Career & Job Search Help' => 'life skills',
      "01-Sophie's Studio" => 'life skills',
      '01-Appel Salon Programming' => 'life skills',
      '01-Entrepreneur in Residence' => 'life skills',
      '01-Fabrication Studio' => 'life skills'
  }

  def self.programs(json_file)
    read_and_parse(json_file).each do |values|
      whitelisted_json = values
        .transform_keys { |key, _value| LOOKUP[key] }
        .slice(*whitelisted_attributes)
      whitelisted_json.merge!(master_category: find_master_category(whitelisted_json['primary_event_type']))
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

  def self.find_master_category(primary_event_type)
    return unless primary_event_type.present?
    CATEGORY_TYPE[primary_event_type]
  end
end