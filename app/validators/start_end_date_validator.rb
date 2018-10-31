###
# Validates that end date will be greater than start date
###
class StartEndDateValidator < ActiveModel::Validator
  def validate(record)
    return if record.end_date.blank? || record.start_date.blank?

    record.errors[:end_date] << 'must be after the start date' if
    record.end_date < record.start_date
  end
end
