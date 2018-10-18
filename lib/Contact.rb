class Contact
  attr_accessor :name, :soname, :patronumic, :address, :status, :phone, :home_phone

  def initialize(name, soname, patronumic='', phone='', home_phone='', address='', status='')

    # Имя
    # type: string
    # @require
    @name = name

    # Фамилия
    # type: string
    # @require
    @soname = soname

    # Отчество
    # type: string
    @patronumic = patronumic

    # Мобильный телефон
    # type: string
    @phone = phone

    # Домашний телефон
    # type: string
    @home_phone = home_phone

    # Адрес
    # type: string
    @address = address

    # Статус
    # type: string
    @status = status
  end

  def to_s
    return @name + ' ' +
      @soname + ' ' +
      @patronumic + ' ' +
      @phone + ' ' +
      @home_phone + ' ' +
      @address + ' ' +
      @status
  end

  def prepare_for_file_write
    result = [
       @name,
       @soname,
       @patronumic,
       @phone,
       @home_phone,
       @address,
       @status
     ]
    return result
  end

end
