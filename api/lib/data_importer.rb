module DataImporter
  extend self

  def programs(file_path)
    CsvParser.each_with_header(file_path) do |row|
      Program.create!(row)
    end
  end
end