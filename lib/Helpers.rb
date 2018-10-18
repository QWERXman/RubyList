require_relative('./Constants')


module Helpers
  # Проверка допустимого поля контакта
  def self.check_right_field(field)
    return FIELD_TYPES.include? field
  end
end
