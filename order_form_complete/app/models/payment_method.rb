class PaymentMethod < ApplicationRecord
  class << self
    def selectable_methods
      all.map { |type| [type.name, type.id] }
    end
  end
end
