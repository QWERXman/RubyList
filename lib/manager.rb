require_relative('./contact')
require_relative('./file_reader')

# Core functions of the application
module Manager
  # Add a contact
  def self.add_contact
    puts 'Enter contact data by template: {Name} {Soname} {Patronumic}
      {Phone} {HomePhone} {Address} {Status}'

    data = gets.chomp.split(/\s+/)

    puts 'Error data' if data.size < 2

    FileReader.add_contact(Contact.new(*data[0..6]))
  end

  # Delete a contact
  def self.delete_contact
    puts 'Enter name and soname contact to delete'

    name = gets.chomp.split(/\s+/)

    puts 'Error data' if name.size < 2

    FileReader.delete_contact(*name)
  end

  # Change of contact information
  def self.change_info
    puts 'Enter name and soname contact to changing'
    name = gets.chomp.split(/\s+/, 2)
    puts 'Enter field name and data contact to changing'
    data = gets.chomp.split(/\s+/, 2)

    puts 'Error data' if name.size < 2 || data.size < 2

    FileReader.update_contact(*name, *data)
  end

  # Creating a list of invitations
  def self.create_list
    puts 'Enter status contacts and message'

    status, message = gets.chomp.split(/\s/, 2)

    FileReader.read_with_status_filter(status).each do |cont|
      File.open("#{cont[:name].capitalize}#{cont[:soname].capitalize}.txt",
                'w') do |f|
        f.write("#{cont[:name].capitalize} #{cont[:soname].capitalize}\n" +
          message.to_s)
      end
    end
  end

  # Show the entire contact list
  def self.show_all_contacts
    FileReader.read_contacts.each do |cont|
      puts cont.to_s
    end
  end
end
