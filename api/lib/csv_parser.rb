require 'csv'

module CsvParser
  extend self

  def each_with_header(file_path)
    CSV.foreach(file_path, headers: true) do |row|
      yield(row.to_h)
    end
  end
end