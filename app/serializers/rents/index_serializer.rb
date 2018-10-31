module Rents
  class IndexSerializer < ActiveModel::Serializer
    attributes :id, :from, :to, :returned_at

    def from
      start_date
    end

    def to
      end_date
    end

    def returned_at
      nil
    end

    #has_one :user, key: :user, serializer: Users::ShowSerializer
    #has_one :book, key: :book, serializer: Books::BasicShowSerializer
  end
end
