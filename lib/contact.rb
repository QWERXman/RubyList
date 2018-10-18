# Contact
class Contact
  attr_accessor :name, :soname, :patronumic,
                :address, :status, :phone, :home_phone

  def initialize(name, soname, patronumic = '', phone = '',
                 home_phone = '', address = '', status = '')
    # First name
    # type: string
    # @require
    @name = name

    # Last name
    # type: string
    # @require
    @soname = soname

    # Patronumic
    # type: string
    @patronumic = patronumic

    # Mobile phone number
    # type: string
    @phone = phone

    # Home phone number
    # type: string
    @home_phone = home_phone

    # Address
    # type: string
    @address = address

    # Status
    # type: string
    @status = status
  end

  def to_s
    @name +
      ' ' + @soname +
      ' ' + @patronumic +
      ' ' + @phone +
      ' ' + @home_phone +
      ' ' + @address +
      ' ' + @status
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
    result
  end
end
