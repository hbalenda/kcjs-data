require 'csv'

desc 'Import CSV'
task :import_csv do
  csv_text = File.read('data/KCJSTESTDATA.csv')
  csv = CSV.parse(csv_text, :headers => true)
  csv.each do |row|
    Entry.create!(row.to_hash)
  end
end
