module Rents
  class ShowSerializer < ActiveModel::Serializer
    attributes :id, :from, :to, :book_id, :user_id, :returned_at

    def from
      object.start_date
    end

    def to
      object.end_date
    end
  end
end
