module Rents
  class IndexSerializer < ActiveModel::Serializer
    attributes :id, :from, :to, :returned_at

    def from
      object.start_date
    end

    def to
      object.end_date
    end

    has_one :book, key: :book, serializer: Books::RentIndexSerializer
    has_one :user, key: :user, serializer: Users::ShowSerializer
  end
end
