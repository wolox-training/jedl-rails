module Books
  class RentCreateSerializer < ActiveModel::Serializer
    attributes :id, :author, :title, :genre, :publisher, :year, :image_url, :description

    def image_url
      object.image
    end

    def publisher
      object.editor
    end

    def description
      nil
    end
  end
end
