class EmailFormatValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return if value.blank?
    record.errors.add(attribute, 'の形式が正しくありません') unless /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.match? value
  end
end