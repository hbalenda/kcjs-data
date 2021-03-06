require 'csv'

class Entry < ApplicationRecord
  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      Entry.create row.to_hash
    end
  end
end
