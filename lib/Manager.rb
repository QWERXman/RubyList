require_relative('./Contact')
require_relative('./FileReader')


module Manager

  # Добавление контакта
  def self.add_contact()
    puts 'Enter contact data by template: {Name} {Soname} {Patronumic} {Phone} {HomePhone} {Address} {Status}'

    data = gets.chomp.split( /\s+/ )

    if data.size < 2
      puts 'Error data'

    end

    FileReader.add_contact(Contact.new(*data[0 .. 6]))

  end

  # Удаление контакта
  def self.delete_contact()
    puts 'Enter name and soname contact to delete'

    name = gets.chomp.split( /\s+/ )

    if name.size < 2
      puts 'Error data'
    end

    FileReader.delete_contact(*name)
  end

  # Изменение информации по контакту
  def self.change_info()
    puts 'Enter name and soname contact to changing'

    name = gets.chomp.split( /\s+/ )

    if name.size < 2
      puts 'Error data'
    end

    FileReader.update_contact()
  end

  # создание списка приглашений
  def self.create_list()

    puts 'Enter status contacts and message'

    status, message = gets.chomp.split(/\s/, 2)

    FileReader.read_with_status_filter(status).each do |cont|
      File.open("#{cont[:name].capitalize}#{cont[:soname].capitalize}.txt", 'w') do |f|
         f.write("#{cont[:name].capitalize} #{cont[:soname].capitalize}\n" +
           "#{message}")
       end
    end
  end

  # Вывести весь список контактов
  def self.show_all_contacts()
    FileReader.read_contacts.each do |cont|
      puts cont.to_s
    end
  end

end
