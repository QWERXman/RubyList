require 'csv'
require_relative('./Contact')
require_relative('./Helpers')


module FileReader

  @@file_name = '/home/qwerxman/Рабочий стол/RubyList/lib/Contacts.csv'

  # Вычитывает из файла контакты
  # Возвращает массив контактов
  def self.read_contacts
    contacts = []

    CSV.foreach(@@file_name, headers: true) do |row|
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

    return contacts
  end

  # Добавляет в файл новый контакт
  def self.add_contact(contact)
    CSV.open(@@file_name, "a") do |file|
      file.add_row(contact.prepare_for_file_write)
    end
  end

  # Удаление контакта по имени и фамилии
  def self.delete_contact(name, soname)

    table = CSV.table(@@file_name)

    table.delete_if do |row|
      row[:name] == name and row[:soname] == soname
    end

    File.open(@@file_name, "w") do |file|
      file.write(table.to_csv)
    end

  end

  # Изменение данных в определенном поле контакта
  def self.update_contact(name, soname, field, data)

    if not Helpers.check_right_field(field)
      return
    end

    table = CSV.table(@@file_name)

    table.each do |row|
      if row[:name] == name and row[:soname] == soname
        row[:"#{field}"] = data
      end
    end

    File.open(@@file_name, "w") do |file|
      file.write(table.to_csv)
    end

  end

  # Чтение контактов определенным статусом
  def self.read_with_status_filter(status)
    table = CSV.table(@@file_name)
    result = []

    table.each do |row|
      if row[:status] == status
        result << row
      end
    end

    return result
  end

end
