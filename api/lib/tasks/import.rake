namespace :import do

  desc "Import program data"
  task :programs, [:file_path] do |_task, args|
    ActiveRecord::Base.transaction do
      DataImporter.programs(args.file_path)
    end
  end

end
