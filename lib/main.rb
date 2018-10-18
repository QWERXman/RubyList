require_relative('./constants')
require_relative('./manager')

# Starting point in the application
module Main
  def self.run
    self.show_menu
  end

  def self.show_menu
    puts 'Select action'
    puts '1) Add contact'
    puts '2) Delete contact'
    puts '3) Change contact info'
    puts '4) Create invitation list'
    puts '5) Show all contacts'

    begin
      action_id = Integer(gets.chomp)
    rescue
      return
    end

    case action_id
    when ACTION_TYPES[:add_contact]
      Manager.add_contact
    when ACTION_TYPES[:delete_contact]
      Manager.delete_contact
    when ACTION_TYPES[:change_info]
      Manager.change_info
    when ACTION_TYPES[:create_list]
      Manager.create_list
    when ACTION_TYPES[:show_all_contacts]
      Manager.show_all_contacts
    else return
    end

    self.show_menu
  end
end
