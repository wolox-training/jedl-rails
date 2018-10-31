module Books
  class BasicShowSerializer < ActiveModel::Serializer
    attributes :id, :author, :title, :genre, :publisher, :year, :image_url

    def image_url
      object.image
    end

    def publisher
      object.editor
    end
  end
end