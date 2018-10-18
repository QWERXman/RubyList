require 'csv'
require_relative('./contact')
require_relative('./helpers')

# Module for working with files
module FileReader
  # Read contacts from a file
  # Returns an array of contacts
  def self.read_contacts
    contacts = []

    CSV.foreach(FILE_NAME, headers: true) do |row|
      contacts << Contact.new(
        row['name'],
        row['soname'],
        row['patronumic'],
        row['phone'],
        row['homephone'],
        row['address'],
        row['status']
      )
    end

    contacts
  end

  # Adds a new contact to the file
  def self.add_contact(contact)
    CSV.open(FILE_NAME, 'a') do |file|
      file.add_row(contact.prepare_for_file_write)
    end
  end

  # Delete contact by first and last name
  def self.delete_contact(name, soname)
    table = CSV.table(FILE_NAME)

    table.delete_if do |row|
      row[:name] == name && row[:soname] == soname
    end

    File.open(FILE_NAME, 'w') do |file|
      file.write(table.to_csv)
    end
  end

  # Changing data in a specific contact field
  def self.update_contact(name, soname, field, data)
    return unless Helpers.check_right_field(field)

    table = CSV.table(FILE_NAME)

    table.each do |row|
      row[:"#{field}"] = data if row[:name] == name && row[:soname] == soname
    end

    File.open(FILE_NAME, 'w') do |file|
      file.write(table.to_csv)
    end
  end

  # Read contacts with a cpecific status
  def self.read_with_status_filter(status)
    table = CSV.table(FILE_NAME)

    result = []

    table.each do |row|
      result << row if row[:status] == status
    end
    result
  end
end
