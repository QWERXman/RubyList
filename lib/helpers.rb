require_relative('./constants')

# helper functions
module Helpers
  # Check for a valid contact field
  def self.check_right_field(field)
    FIELD_TYPES.include? field
  end
end
