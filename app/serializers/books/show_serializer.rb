module Books
  class ShowSerializer < ActiveModel::Serializer
    attributes :id, :author, :title, :genre, :publisher, :year, :image_url

    def image_url
      object.image
    end

    def publisher
      object.editor
    end

    has_many :rents, key: :actual_rent, serializer: Rents::ShowSerializer
  end
end
